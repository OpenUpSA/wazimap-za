import argparse
import csv

from psycopg2 import connect, sql


def csv_to_table(file_path, table_name, metric_column_name, skip_fields, geo_version, connection_string):
    skip_fields = ['', 'geo_level', 'geo_code'] + skip_fields
    connection = connect(connection_string)
    cursor = connection.cursor()
    stmt = sql.SQL("""
        INSERT INTO {}
            (geo_version, geo_level, geo_code, {}, total)
            VALUES(%s, %s, %s, %s, %s)
        """) \
        .format(
            sql.Identifier(table_name),
            sql.Identifier(metric_column_name),
        )
    with open(file_path) as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            for column, value in row.items():
                if column in skip_fields:
                    continue
                cursor.execute(
                    stmt,
                    (geo_version, row['geo_level'], row['geo_code'], column, value))
    connection.commit()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("file_path")
    parser.add_argument("table_name")
    parser.add_argument("metric_column_name")
    parser.add_argument(
        '-s', '--skip', action='append',
        help='Column that should be ignored. This argument can be repeated.')
    parser.add_argument(
        '-g', '--geo-version', default='2011',
        help='Geo version, by default=2011')
    parser.add_argument(
        '-c', '--connection-string', default='',
        help='Connection string, like postgresql://user:secret@localhost/db_name')
    args = parser.parse_args()
    csv_to_table(
        args.file_path, args.table_name, args.metric_column_name,
        args.skip, args.geo_version, args.connection_string)
