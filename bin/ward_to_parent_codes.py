import argparse
import csv
import requests
from collections import defaultdict
import json

# Set the following value
TABLE_COLUMN = 'year'

FIELD_NAMES = ["geo_level", "geo_code", TABLE_COLUMN, "total"]
GEO_LEVELS = ["country", "province", "district", "municipality", 'ward']


MAPIT_URL = "http://mapit.code4sa.org/area/MDB:{}/covered"


def convert_file(args):
    with open(args.output_file, 'wb') as output:
        with open(args.input_file) as f:
            with open(args.geocode_file) as geo_file:
                reader = csv.DictReader(f)
                writer = csv.DictWriter(output, fieldnames=FIELD_NAMES)
                writer.writeheader()

                #
                # Get parent geos from Mapit
                # This was only used on the initial run, we now use the geo_json file.
                #
                # geo_writer = csv.DictWriter(geo_file, fieldnames=FIELD_NAMES)

                # ward_ids = set()
                # for row in reader:
                #     ward_ids.add(row['geo_code'])

                # geo_codes = defaultdict(list)

                # for ward_id in ward_ids:
                #     url = MAPIT_URL.format(ward_id)
                #     resp = requests.get(url)
                #     import ipdb; ipdb.set_trace()
                #     if 'error' in resp.json().keys():
                #         print "Error: " + ward_id
                #     else:
                #         for geo_level in resp.json().values():
                #             geo_codes[ward_id].append({
                #                 "geo_level": geo_level['type_name'].lower(),
                #                 "geo_code": geo_level['codes']['MDB']
                #             })

                # json.dump(geo_codes, geo_file)

                geo_codes = json.loads(geo_file.read())
                parent_levels = defaultdict(float)

                no_mapit_data = set()

                for row in reader:
                    try:
                        for geo in geo_codes[str(row['geo_code'])]:
                            # parent_levels[geo['geo_level'], geo['geo_code'], row['year'], row['crime type']] += float(row['total'])
                            # data = {
                            #     "geo_level": row['geo_level'],
                            #     "geo_code": row['geo_code'],
                            #     "year": row['year'],
                            #     "crime type": row['crime type'],
                            #     "total": row["total"]
                            # }

                            parent_levels[geo['geo_level'], geo['geo_code'], row[TABLE_COLUMN]] += float(row['total'])

                        data = {
                            "geo_level": row['geo_level'],
                            "geo_code": row['geo_code'],
                            TABLE_COLUMN: row[TABLE_COLUMN],
                            "total": row["total"]
                        }

                        writer.writerow(data)

                    except KeyError:
                        no_mapit_data.add(row['geo_code'])

                print "No data: " + str([ward for ward in no_mapit_data])

                for geo_values, total in parent_levels.items():
                    data = {
                        "geo_level": geo_values[0],
                        "geo_code": geo_values[1],
                        TABLE_COLUMN: geo_values[2],
                        "total": total
                    }
                    writer.writerow(data)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Converts crime CSV file into FieldTable format')
    parser.add_argument('--input_file', help='File to convert', required=True)
    parser.add_argument('--output_file', help='File to write to', required=True)
    parser.add_argument('--geocode_file', help='File with geo codes', required=True)
    args = parser.parse_args()
    convert_file(args)
