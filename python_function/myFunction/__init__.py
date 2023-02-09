import logging
import re
import azure.functions as func

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

    if name:
        return func.HttpResponse(f"Hello, {name}.\nYour IP is {host} and you are using: {agent}.")
    else:
        return func.HttpResponse(
            "HTTP function executed successfully. Usage: pass a name on the query string or in the request body",
            status_code=200
        )
