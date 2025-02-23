import requests
import json
import boto3
import io

url = "https://www.dnd5eapi.co/api/spells"

def get_data(url):
    response = requests.get(url)
    return response.json()

def write_data_s3(data, bucket_name, object_name):
    s3 = boto3.client('s3')
    json_bytes = json.dumps(data, indent=4).encode('utf-8')
    with io.BytesIO(json_bytes) as f:
        s3.upload_fileobj(f, bucket_name, object_name)


if __name__ == "__main__":
    write_data_s3(get_data(url), "dnd-data-dan-new", "spells.json")
