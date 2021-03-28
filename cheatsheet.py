from github import Github
from random import randint
import logging

logger = logging.getLogger()


class cheatsheet:
    repo_name = "rstudio/cheatsheets"
    raw_github = "https://raw.githubusercontent.com/rstudio/cheatsheets/master/"

    def __init__(self):
        logger.info("Initialising cheatsheet")
        logger.info("Looking up the full cheatsheet list")
        self.repo = Github().get_repo(self.repo_name)
        self.cheatsheets = self.repo.get_contents("pngs")

        logger.info("Randomly selecting a cheatsheet")
        self.n_sheets = len(self.cheatsheets)
        self.sheet_n = randint(1, self.n_sheets - 1)
        self.sheet = self.cheatsheets[self.sheet_n]

        logger.info("Extracting the name of the selected cheatsheet")
        self.path = self.sheet.path
        self.name = self.path.removesuffix(".png")
        self.name = self.name.removeprefix("pngs/")

        logger.info("Getting the paths related to the target cheatsheet")
        self.png = "".join([self.raw_github, self.path])
        self.pdf = "".join([self.raw_github, self.name, ".pdf"])

    def message(self):
        logger.info("Building a message with the cheatsheet information")
        message = [
            f"Today's #rstats cheatsheet: {self.name}",
            f"Download: {self.pdf}",
            "See more: https://www.rstudio.com/resources/cheatsheets/",
            "Contribute your own: https://github.com/rstudio/cheatsheets",
        ]
        message = " \n".join(message)
        return message
