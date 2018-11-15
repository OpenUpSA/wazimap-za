import argparse

from psycopg2 import connect, sql


def create_table(table_name, metric_column_name, connection_string=''):
    connection = connect(connection_string)
    cursor = connection.cursor()
    stmt = sql.SQL(
        '''
        CREATE TABLE {} (
            geo_level varchar,
            geo_code varchar,
            {} varchar,
            total varchar,
            geo_version varchar
        )''') \
        .format(
            sql.Identifier(table_name),
            sql.Identifier(metric_column_name))
    cursor.execute(stmt)
    connection.commit()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("table_name")
    parser.add_argument("metric_column_name")
    parser.add_argument(
        '-c', '--connection-string', default='',
        help='Connection string, like postgresql://user:secret@localhost/db_name')
    args = parser.parse_args()
    create_table(
        args.table_name, args.metric_column_name, args.connection_string)
