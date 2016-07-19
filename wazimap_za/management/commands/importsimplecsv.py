import csv

from django.core.management.base import BaseCommand, CommandError

from wazimap.data.utils import get_session
from wazimap.data.tables import get_datatable, get_table_id


import logging

logging.basicConfig()
logging.getLogger('sqlalchemy.engine').setLevel(logging.WARN)

"""
This is a helper script that reads in a structured CSV file with
column names that match the database columns to be created
and imports the data into the Wazi database, creating tables as necessary.
A total column is expected.
"""


class Command(BaseCommand):
    help = ("Imports data from a structured CSV file. " +
            "The database table is automatically created from the fields in " +
            "the file headers. Must be in the format" +
            "geo_level, geo_code, [fields], total")

    def add_arguments(self, parser):
        parser.add_argument(
            'filepath',
            action='store',
            help='The file path to a structured CSV file'
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
            help="Dry-run, don't actuall write any data.",
        )

    def debug(self, msg):
        if self.verbosity >= 2:
            self.stdout.write(str(msg))

    def handle(self, *args, **options):
        self.filepath = options['filepath']

        self.verbosity = options.get('verbosity', 1)
        self.table_id = options.get('table')
        self.dryrun = options.get('dryrun', False)

        if self.dryrun:
            self.stdout.write("DRY RUN: not actuall writing data")

        with open(self.filepath) as f:
            self.f = f
            self.reader = csv.DictReader(self.f, delimiter=",")
            # Fields excluding geo_level, geo_code and total
            self.fields = self.reader.fieldnames[2:-1]

            self.setup_table()
            self.store_values()

    def setup_table(self):
        table_id = self.table_id or get_table_id(self.fields)
        try:
            self.table = get_datatable(table_id)
            self.stdout.write("Table for fields %s is %s" % (self.fields, self.table.id))
        except KeyError:
            raise CommandError("Couldn't establish which table to use for these fields. Have you added a FieldTable entry in wazimap_za/tables.py?\nFields: %s" % self.fields)

    def store_values(self):
        session = get_session()
        count = 0
        for row in self.reader:
            count += 1
            # Round to nearest number as we're expecting Integers.
            row['total'] = int(round(float(row['total'])))
            self.stdout.write("%s-%s" % (row['geo_level'], row['geo_code']))
            entry = self.table.get_model(row['geo_level'])(**row)

            if not self.dryrun:
                session.add(entry)

            if count % 100 == 0:
                session.flush()

        if not self.dryrun:
            session.commit()

        session.close()
