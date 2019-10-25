import pandas
import requests
import argparse
import os
parser = argparse.ArgumentParser(
    description="script to find the geographical levels of a point"
)
parser.add_argument("file", help="csv file")
parser.add_argument(
    "--host", help="url for the mapit host", default="http://mapit.openup.org.za"
)
parser.add_argument(
    "--generation", help="which shape file versions 1-> 2011, 2-> 2016", default=2
)

args = parser.parse_args()

dataframe = pandas.read_csv(args.file)
dataframe["Province"] = ""
dataframe["District"] = ""
dataframe["Municipality"] = ""
dataframe["Ward"] = ""


print("Geocoding........")
for i, series in dataframe.iterrows():
    print(f"Working on {series['Name']}")
    lat = series["Latitude"]
    lng = series["Longitude"]
    url = f"{args.host}/point/4326/{lng},{lat}?type=PR,DC,MN,CY,WD&generation={args.generation}"
    req = requests.get(url)
    geo = req.json()
    if geo:
        for _, value in geo.items():
            if value["type_name"] == "Municipality":
                mdb_code = value["codes"]["MDB"]
                dataframe.at[i, "Municipality"] = mdb_code
            elif value["type_name"] == "District":
                mdb_code = value["codes"]["MDB"]
                dataframe.at[i, "District"] = mdb_code
            elif value["type_name"] == "Province":
                mdb_code = value["codes"]["MDB"]
                dataframe.at[i, "Province"] = mdb_code
            elif value["type_name"] == "Ward":
                mdb_code = value["codes"]["MDB"]
                dataframe.at[i, "Ward"] = mdb_code


filename = f"geocoded_{os.path.basename(args.file)}"
with open(filename, "w") as fp:
    dataframe.to_csv(fp)

