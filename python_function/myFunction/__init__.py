import logging

import azure.functions as func

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    headers = dict(req.headers)
    agent = headers.get("user-agent")
    host = headers.get("x-forwarded-for")

 #   if host == "":
 #       host = headers.get("host")
 #   else:
 #       host = "[Can't detect :(]"

    if name:
        return func.HttpResponse(f"Hello, {name}.\nYour IP is {host} and you are using:\n{agent}.")
    else:
        return func.HttpResponse(
            "HTTP function executed successfuly. Usage: pass a name on the query string or in the request body",
            status_code=200
        )
