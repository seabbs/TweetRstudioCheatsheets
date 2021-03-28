import logging
import requests
from create_api import create_api
from cheatsheet import cheatsheet

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

def post_cheatsheet():
    api = create_api()
    sheet = cheatsheet()
    tweet = sheet.message()
    status = api.update_status(status = tweet,
                               attachment_url = sheet.png)
    return 0