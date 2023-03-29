import logging
import re, random, string
import requests
import azure.functions as func

def generate_password():
    letters = string.ascii_letters
    digits = string.digits
    special = string.punctuation
    min_length = random.randint(12, 16)
    all_char = letters + digits + special
    pwd = ""
    while len(pwd) != min_length:
        new_char = random.choice(all_char)
        pwd += new_char
    return pwd

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            # looking for name in req body
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    headers = dict(req.headers)
    host = headers.get("x-forwarded-for")
    agent = headers.get("user-agent")
    agent = re.split(r"(.*? \()(.*?)(\).*)", agent)[2]
        
    if host == None:
        host = headers.get("host")

    ip, port = re.split(r"(.*?):(.*?)", host)[1], re.split(r"(.*?):(.*?)", host)[3]
    location_resp = requests.get(f'https://ipapi.co/{ip}/json/').json()

    password = generate_password()

    if name:
        return func.HttpResponse(f"""Hello, {name}.\nYour IP is {ip}, your port is {port} 
and you are using: {agent}. 
You are located in {location_resp['city']}, {location_resp['country_name']}.
Randomly generated password: {password} """)
    else:
        return func.HttpResponse(
            f"""HTTP function executed successfully. Usage: pass a name on the query string or in the request body.
Randomly generated password: {password}""",
            status_code=200
        )
