import copy
import csv
import re

from django.core.management.base import BaseCommand, CommandError

from wazimap.data.utils import get_session
from wazimap.data.tables import get_datatable, get_table_id
from wazimap.geo import geo_data


import logging

logging.basicConfig()
logging.getLogger('sqlalchemy.engine').setLevel(logging.WARN)

"""
This is a helper script that reads in a SuperCROSS or SuperWEB
CSV file and imports the data into the Wazi database, creating
tables as necessary.
"""

muni_re = re.compile('^[A-Z]{2,3}\d{0,3}\s*:\s.*$')
# 270403001 Gobisandla SP
subplace_re = re.compile('^\d{9}\s+')


class Command(BaseCommand):
    help = ("Imports data from a SuperWEB- or SuperCROSS-generated CSV file. " +
            "The database table is automatically created from the fields in " +
            "the file headers.")

    def add_arguments(self, parser):
        parser.add_argument(
            'filepath',
            action='store',
            help='The file path to a SuperCROSS or SuperWEB CSV export'
        )
        parser.add_argument(
            '--table',
            action='store',
            dest='table',
            default=None,
            help='The name of the database table where the imported data will be stored. '
                 'If not provided, it is generated from the field names'
        )
        parser.add_argument(
            '--dry-run',
            action='store_true',
            dest='dryrun',
            default=False,
            help="Dry-run, don't actually write any data.",
        )
        parser.add_argument(
            '--geo-version',
            action='store',
            dest='geo_version',
            default=None,
            required=True,
            help='The geography demarcation version that this table refers to'
        )
        parser.add_argument(
            '--release-year',
            action='store',
            dest='release_year',
            default=None,
            required=True,
            help='The release year of the data to import'
        )

    def debug(self, msg):
        if self.verbosity >= 2:
            self.stdout.write(str(msg))

    def handle(self, *args, **options):
        self.filepath = options['filepath']
        self.includes_total = False
        self.verbosity = options.get('verbosity', 1)
        self.table_id = options.get('table')
        self.dryrun = options.get('dryrun', False)
        self.geo_version = options.get('geo_version')
        self.release_year = options.get('release_year')
        self.provinces = {g.name.lower(): g for g in geo_data.geo_model.objects.filter(version=self.geo_version).filter(geo_level='province')}
        self.districts = {g.name.lower(): g for g in geo_data.geo_model.objects.filter(version=self.geo_version).filter(geo_level='district')}
        self.metros = {g.name.lower(): g for g in geo_data.geo_model.objects.filter(version=self.geo_version).filter(geo_level='municipality').filter(parent_level='province')}

        if self.dryrun:
            self.stdout.write("DRY RUN: not actually writing data")

        with open(self.filepath) as f:
            self.f = f
            self.read_headers()
            self.setup_table()
            self.store_values()

    def read_headers(self):
        line = next(self.f)
        self.f.seek(0)

        if "Statistics South Africa" in line:
            self.read_supercross_headers()
        elif "SuperWEB2" in line:
            self.read_superweb_headers()
        else:
            raise ValueError("Unknown format of CSV data")

    def read_supercross_headers(self):
        '''
        Return fields and tuples of categories for this supercross export.
        Categories are defined by the permutations of values for each field.
        For an export with fields [gender, race, age], categories will be a
        list like [
          ('male', 'black', '0-5'),
          ('male', 'black', '6-10'),
          ...
          ('male', 'white', '0-5'),
          ...
          ]

        Example headers:

        Statistics South Africa
        Education_Electoral_Wards
        Table 1
    "Geography by Highest educational level, Population group and Gender"
    " for Person weighted, 05 - 09 - 85+"
        ...
        '''
        self.reader = csv.reader(self.f, delimiter=",")

        # skip first three lines
        for i in xrange(3):
            next(self.reader)

        # Geography by Highest educational level, Population group and Gender
        line = next(self.reader)[0].strip()
        fields = line\
            .replace("Geography by", "")\
            .strip()\
            .replace(" and ", ", ")\
            .split(", ")
        self.fields = [f.strip().lower() for f in fields]

        # skip next line
        next(self.reader)

        # read in categories for each field, one per line
        cat_headers = []
        for i, line in enumerate(self.reader):
            cat_headers.append(line[1:])

            if i == len(fields) - 1:
                break
        self.categories = zip(*cat_headers)

    def read_superweb_headers(self):
        '''
        Return fields and categories for this superweb export.

        Example: (['Like colour?', 'Colour'],
                  [('Yes', 'Blue'), ('Yes', 'Red'), ('No', 'Blue'), ('No', 'Red')])

        Example headers:

        SuperWEB2(tm)

        "Descriptive"
        "Geography by Gender and Population group"
        "Counting: Person weighted"

        Filters:
        "Default Summation","Person weighted"

        "Gender","Male",,,,,"Female",,,,,"Total",,,,,
        "Population group","Black African","Coloured","Indian or Asian","White","Other","Black African","Coloured","Indian or Asian","White","Other","Black African","Coloured","Indian or Asian","White","Other",
        "Geography",
        "DC10: Cacadu",117806.22622,75838.03976,858.21112,23611.3976,2132.2789,122204.04175,81281.84145,659.42599,25355.4941,837.27307,240010.2679701,157119.88121,1517.63711,48966.8917,2969.55197,
        ...

        '''
        self.reader = csv.reader(self.f, delimiter=",")
        # skip headers
        for row in self.reader:
            if row and row[0] == 'Filters:':
                break

        # skip filter rows
        if row[0] == 'Filters:':
            for row in self.reader:
                if len(row) == 0 or all(cell == '' for cell in row):
                    break
        else:
            raise ValueError("Couldn't find Filters header")

        fields = []
        categories = None
        for row in self.reader:
            if row[0] == ' Total':
                continue
            if row[0].startswith("Geography"):
                break
            fields.append(row[0].lower())
            categories_for_field = row[1:]

            # Repeat category value until next value
            last = categories_for_field[0]
            for i, val in enumerate(categories_for_field):
                if val.strip() == "":
                    categories_for_field[i] = last
                else:
                    last = val

            # Remove last category value if empty or "Total"
            if categories_for_field[-1] == "":
                del categories_for_field[-1]
            if categories_for_field[-1] == 'Total':
                self.includes_total = True
                del categories_for_field[-1]
            else:
                self.includes_total = False

            # zip the categories
            if categories is None:
                categories = [(c, ) for c in categories_for_field]
            else:
                categories = [tup + (categories_for_field[i], )
                              for i, tup in enumerate(categories)]

        self.fields = fields
        self.categories = categories

    def read_rows(self):
        '''
        Second through to final call returns the geo code (or name if it's a province)
        and a list of integer totals, one for each combination of column values.
        Example: ('DC10', [10, 14, 12, 7])
        '''
        for i, row in enumerate(self.reader):
            if len(row) == 0 or 'All cells in this table' in row[0]:
                break

            geo_name = row[0]
            if geo_name == 'Total':
                geo_name = ""

            if row[-1] == "":
                del row[-1]

            if self.includes_total:
                yield geo_name, row[1:-1]
            else:
                yield geo_name, row[1:]

    def setup_table(self):
        table_id = self.table_id or get_table_id(self.fields)
        try:
            self.table = get_datatable(table_id).get_db_table(year=self.release_year)
            self.stdout.write("Table for fields %s is %s" % (self.fields, self.table.id))
        except KeyError:
            raise CommandError("Couldn't establish which table to use for these fields. Have you added a FieldTable entry in wazimap_za/tables.py?\nFields: %s" % self.fields)

    def store_values(self):
        session = get_session()
        count = 0
        stored_values = {}

        for geo_name, values in self.read_rows():
            if all(not val for val in values):
                break
            count += 1
            geo_level, geo_code = self.determine_geo_id(geo_name)

            self.stdout.write("%s-%s" % (geo_level, geo_code))

            for category, value in zip(self.categories, values):
                # prepare the dict of args to pass to the db model for this row
                kwargs = {
                    'geo_level': geo_level,
                    'geo_code': geo_code,
                    'geo_version': self.geo_version,
                }

                kwargs.update(dict((f, v) for f, v in zip(self.fields, category)))
                if value == '-':
                    value = '0'
                total = round(float(value.replace(',', '')))
                stored_key = tuple(sorted(list(kwargs.items())))
                if stored_key in stored_values:
                    if stored_values[stored_key] == total:
                        self.stdout.write("Skipping already-added value for key %r" % list(stored_key))
                        continue
                    else:
                        raise Exception("Different value %r != %r for duplicate key %r" % (stored_values[stored_key], total, stored_key))
                stored_values[stored_key] = total
                kwargs['total'] = total

                # create and add the row
                self.debug(kwargs)
                entry = self.table.model(**kwargs)
                if not self.dryrun:
                    session.add(entry)

            if count % 100 == 0:
                session.flush()

        if not self.dryrun:
            session.commit()
        session.close()

    def determine_geo_id(self, geo_name):
        """ Return a [geo_level, geo_code] tuple.
        """
        if geo_name == "":
            return ['country', 'ZA']

        level = None
        if ':' in geo_name:
            # DC10: Sarah Baartman
            pre, code = geo_name.split(':', 1)
            pre = pre.strip(); code = code.strip()
        else:
            pre = code = geo_name

        if 'Ward' in geo_name:
            # 21009001 Ward 1
            level = 'ward'
            code = pre
        elif geo_name.startswith('DC'):
            # DC10: Sarah Baartman
            level = 'district'
            code = pre.strip()
        elif muni_re.match(geo_name):
            # CPT: City of Cape Town
            # EC109: Kou-Kamma
            level = 'municipality'
            code = pre
        elif subplace_re.match(geo_name):
            level = 'subplace'
            code = pre

        else:
            matches = []
            for geo_level, options in [('province', self.provinces),
                                       ('district', self.districts),
                                       ('municipality', self.metros)]:
                match = options.get(geo_name.strip().lower(), None)
                if match:
                    matches.append((geo_level, match.geo_code))
            if len(matches) == 0:
                raise ValueError("Cannot recognize the geo level of %s" % geo_name)
            elif len(matches) == 1:
                (level, code) = matches[0]
            else:
                raise ValueError("Cannot recognize single geo level of %s: %s" % (geo_name, matches))

        return [level, code]
