import logging
import os
from create_api import create_api
from cheatsheet import cheatsheet

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def post_cheatsheet(request=""):
    api = create_api()
    sheet = cheatsheet()
    tweet = sheet.message()
    filename = "cheatsheet.png"
    sheet.download(filename)
    try:
        api.update_with_media(filename, status=tweet)
    except Exception as e:
        logger.error("Error posting tweet", exc_info=True)
        raise e
    os.remove(filename)
    logger.info("Tweet successfully posted")
