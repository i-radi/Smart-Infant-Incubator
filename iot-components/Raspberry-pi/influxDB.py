import influxdb_client
from influxdb_client.client.write_api import SYNCHRONOUS

org = "organization"
bucket = "incubator_bucket"
url="http://localhost:8086/"
token = "0pkvJVJCtOBt9caBw6R979PaAqY_dQMqFTDT1MwsjHKcOsXWEFM5UeUrUJ17B44khgIKuBY4SMK7NI6gLzns8g=="

client = influxdb_client.InfluxDBClient(
   url=url,
   token=token,
   org=org
)

write_api = client.write_api(write_options=SYNCHRONOUS)
def write(field,value,measurement='incubator',id='18293',tag='IncubatorCode'):
    point = influxdb_client.Point(measurement).tag(tag, id).field(field, value)
    write_api.write(bucket=bucket, org=org, record=point)
