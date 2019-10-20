import requests

def lambda_handler(event, context):
    r = requests.get("http://requestbin.fullcontact.com/v0r1t6v0")
    print(r.status_code)
    print(r.text)
    return r.status_code
