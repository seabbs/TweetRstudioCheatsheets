from github import Github
from random import randint


class cheatsheet:
    repo_name = "rstudio/cheatsheets"
    raw_github = "https://raw.githubusercontent.com/rstudio/cheatsheets/master/"

    def __init__(self):
        # get the cheatsheets stored as pngs in the Rstudio repository
        self.repo = Github().get_repo(self.repo_name)
        self.cheatsheets = self.repo.get_contents("pngs")

        # extract a single random cheatsheet
        # the first is ignored as it is a template
        self.n_sheets = len(self.cheatsheets)
        self.sheet_n = randint(1, self.n_sheets - 1)
        self.sheet = self.cheatsheets[self.sheet_n]

        # get the sheet name
        self.path = self.sheet.path
        self.name = self.path.removesuffix(".png")
        self.name = self.name.removeprefix("pngs/")

        # get the paths for  the various types (pdf and png)
        self.png = "".join([self.raw_github, self.path])
        self.pdf = "".join([self.raw_github, self.name, ".pdf"])

    def message(self):
        message = [
            f"Today's #rstats cheatsheet: {self.name}",
            f"Download: {self.pdf}",
            "See more: https://www.rstudio.com/resources/cheatsheets/",
            "Contribute your own: https://github.com/rstudio/cheatsheets",
        ]
        message = " \n".join(message)
        return message
