import logging
import os
import tempfile
from create_api import create_api
from cheatsheet import cheatsheet

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def post_cheatsheet(request=""):
    api = create_api()
    sheet = cheatsheet()
    tweet = sheet.message()
    filename = tempfile.NamedTemporaryFile()
    sheet.download(filename.name)
    try:
        api.update_with_media(filename.name, status=tweet)
    except Exception as e:
        logger.error("Error posting tweet", exc_info=True)
        raise e
    filename.close()
    logger.info("Tweet successfully posted")
    return "Tweet posted"
