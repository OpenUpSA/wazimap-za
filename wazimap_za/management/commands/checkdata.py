import sys
from collections import defaultdict

from django.core.management.base import BaseCommand
from django.core.management import call_command

from wazimap.data.utils import get_session
from wazimap.data.utils import get_datatable
from wazimap.models import FieldTable, SimpleTable
from wazimap.geo import geo_data

import logging

logging.basicConfig()
logging.getLogger('sqlalchemy.engine').setLevel(logging.WARN)

"""
This is a helper script that checks the tables in the DB for missing geo entries,
and missing keys for fields. The tables with missing values will be output after completion.

If the store_missing_entries flag is passed, the missing items will be populated in the DB.
Missing geos are populated with null values for all keys,
and missing key values are populated with 0.

"""

WC_ONLY_TABLES = [
]

CHECK_TABLES = [
]


class Command(BaseCommand):
    help = ("Checks the database for completeness (or a single table if passed)." +
        "Populates the missing entries if --store-missing-entries is passed")

    def add_arguments(self, parser):
        parser.add_argument(
            '--table',
            action='store',
            dest='table',
            default=None,
            help='Database table name to check, rather than checking everything'
        )
        parser.add_argument(
            '--geo-version',
            action='store',
            dest='geo_version',
            default='2011',
            help='geo_version of the data which should be checked.'
        )
        parser.add_argument(
            '--store-missing-entries',
            action='store_true',
            dest='store_missing_entries',
            default=False,
            help="Write data for missing entries to DB",
        )
        parser.add_argument(
            '--dry-run',
            action='store_true',
            dest='dryrun',
            default=False,
            help="Dry-run, don't actually write any data.",
        )
        parser.add_argument(
            '--dumppsql',
            action='store_true',
            dest='dumppsql',
            default=False,
            help="Perform dump of table into sql directory after writing data to the db.",
        )

    def debug(self, msg):
        if self.verbosity >= 2:
            self.stdout.write(str(msg))

    def handle(self, *args, **options):
        self.session = get_session()
        self.verbosity = options.get('verbosity', 0)
        self.table_id = options.get('table')
        self.geo_version = options.get('geo_version')

        self.store_missing_entries = options.get('store_missing_entries', False)
        self.dryrun = options.get('dryrun')
        self.dumppsql = options.get('dumppsql')

        self.geos = self.get_geos(self.geo_version)

        self.db_tables = []

        self.simple_tables = {}
        self.field_tables = {}

        self.missing_key_tables = []
        self.missing_geo_tables = []
        self.missing_geo_simple_tables = []

        if self.table_id:
            # use normal django models method here
            table = get_datatable(self.table_id)
            if type(table) == FieldTable:
                self.field_tables[table.name.lower()] = table
            else:
                self.simple_tables[table.name.lower()] = table

        elif CHECK_TABLES:
            for table_name in CHECK_TABLES:
                data_table = get_datatable(table_name)
                if type(data_table) == FieldTable:
                    self.field_tables[data_table.name.lower()] = data_table
                else:
                    self.simple_tables[data_table.name.lower()] = data_table

        else:
            self.field_tables = {t.name.lower(): t for t in FieldTable.objects.all()}
            self.simple_tables = {t.name.lower(): t for t in SimpleTable.objects.all()}

        for table_id, data_table in self.field_tables.items():
            fields = data_table.fields
            for release in data_table.releases():
                db_table = data_table.get_db_table(release=release)

                if db_table.name in self.db_tables:
                    # Multiple field tables can refer to the same underlying db table,
                    # and we only want to check the db tables once.
                    continue

                self.db_tables.append(db_table.name)
                self.stdout.write("Checking table: %s" % (db_table.name))

                key_combos = self.get_table_keys(db_table, fields)
                rows = self.session.query(db_table.model).filter(db_table.model.geo_version == self.geo_version).all()
                missing_keys = self.get_missing_keys(db_table, rows, fields, key_combos)

                if missing_keys:
                    self.missing_key_tables.append(db_table.name)
                    if self.store_missing_entries:
                        self.store_missing_keys(db_table, fields, missing_keys)

                missing_geos = self.get_missing_geos(db_table, rows)
                if missing_geos:
                    self.missing_geo_tables.append(db_table.name)
                    if self.store_missing_entries:
                        self.store_missing_geos(db_table, fields, key_combos, missing_geos)


        # Simple Tables
        for table_id, data_table in self.simple_tables.items():
            self.stdout.write("Checking table: %s" % (data_table.name))
            for release in data_table.releases():
                db_table = data_table.get_db_table(release=release)
                rows = self.session.query(db_table.model).filter(db_table.model.geo_version == self.geo_version).all()
                missing_geos = self.get_missing_geos(db_table, rows)

                if missing_geos:
                    self.missing_geo_simple_tables.append(db_table.name)
                    self.store_simple_table_missing_geos(db_table, missing_geos)

        # Basic output if we didn't write anything to the db

        if self.missing_key_tables:
            self.stdout.write("Tables with missing keys:")
            for table_name in self.missing_key_tables:
                self.stdout.write("%s" % (table_name))

        if self.missing_geo_tables:
            self.stdout.write("Missing geos for tables:")
            for table_name in self.missing_geo_tables:
                self.stdout.write("%s" % table_name)

        if self.missing_geo_simple_tables:
            self.stdout.write("Missing geos for Simple tables:")
            for table_name in self.missing_geo_simple_tables:
                self.stdout.write("%s" % table_name)

        if not self.store_missing_entries:
            self.stdout.write("Run command with --store-missing-entries to populate missing keys with 0 and missing geos with null")

        self.session.close()



    def get_geos(self, geo_version):
        return geo_data.geo_model.objects.filter(version=geo_version)

    def get_table_keys(self, table, fields):
        # Return a list with all permuations of the keys for all fields
        keys = []
        for obj in self.session.query(table.model).distinct(*fields):
            keys.append([obj.__getattribute__(field) for field in fields])

        return keys

    def get_missing_keys(self, table, rows, fields, key_combos):
        keys_by_geo = defaultdict(list)
        for row in rows:
            # Get existing key combinations by geo_id
            keys_by_geo[row.geo_level + '-' + row.geo_code].append(
                [row.__getattribute__(field) for field in fields])

        missing_keys_by_geo = {}
        for geo_id, geo_keys in keys_by_geo.items():
            if len(geo_keys) != len(key_combos):
                missing_keys_by_geo[geo_id] = [
                    x for x in key_combos if x not in geo_keys]
        return missing_keys_by_geo


    def get_missing_geos(self, table, rows):
        table_geos = set((row.geo_level, row.geo_code) for row in rows)
        if not table_geos:
            sys.exit("Empty table: %s" % (table.name))

        if table.name in WC_ONLY_TABLES:
            req_geos = set(
                (g.geo_level, g.geo_code) for g in self.wc_geos)
        else:
            req_geos = set((g.geo_level, g.geo_code) for g in self.geos)

        missing_geos = [g for g in req_geos if g not in table_geos]

        return missing_geos

    def store_missing_keys(self, db_table, fields, missing_keys):
        count = 0
        self.stdout.write("Storing missing keys for : %s" % (db_table.name))
        for geo, keys in missing_keys.items():
            for key_values in keys:
                count += 1
                geo_level, geo_code = geo.split('-')
                row = {
                    'geo_level': geo_level,
                    'geo_code': geo_code,
                    'total': 0,
                    'geo_version': self.geo_version}
                for i, field in enumerate(fields):
                    row[field] = key_values[i]

                entry = db_table.model(**row)

                if not self.dryrun:
                    self.session.add(entry)

                if count % 100 == 0:
                    self.session.flush()

        if not self.dryrun:
            self.session.commit()
            if self.dumppsql:
                with open('sql/{0}.sql'.format(db_table.name), 'w') as f:
                    call_command('dumppsql', table=db_table.name, stdout=f)

    def store_missing_geos(self, db_table, fields, key_combos, missing_geos):
        count = 0
        self.stdout.write("Storing missing geos for : %s" % (db_table.name))
        for geo in missing_geos:
            # Entry for each possible key combination for each missing geo
            for key_value in key_combos:
                count += 1
                row = {
                    'geo_level': geo[0],
                    'geo_code': geo[1],
                    'total': None,
                    'geo_version': self.geo_version}
                for i, field in enumerate(fields):
                    row[field] = key_value[i]

                entry = db_table.model(**row)

                if not self.dryrun:
                    self.session.add(entry)

                if count % 100 == 0:
                    self.session.flush()

        if not self.dryrun:
            self.session.commit()
            if self.dumppsql:
                with open('sql/{0}.sql'.format(db_table.name), 'w') as f:
                    call_command('dumppsql', table=db_table.name, stdout=f)

    def store_simple_table_missing_geos(self, db_table, missing_geos):
        count = 0
        self.stdout.write("Storing missing geos for : %s" % (db_table.name))
        for geo in missing_geos:
            count += 1
            row = {
                'geo_level': geo[0],
                'geo_code': geo[1],
                'geo_version': self.geo_version}

            entry = db_table.model(**row)

            if not self.dryrun:
                self.session.add(entry)

            if count % 100 == 0:
                self.session.flush()

        if not self.dryrun:
            self.session.commit()
            if self.dumppsql:
                with open('sql/{0}.sql'.format(db_table.name), 'w') as f:
                    call_command('dumppsql', table=db_table.name, stdout=f)
