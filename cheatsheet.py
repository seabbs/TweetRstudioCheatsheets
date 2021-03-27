from github import Github
from random import randint

# get the cheatsheets stored as pngs in the Rstudio repository
repo_path = "rstudio/cheatsheets"
repo = Github().get_repo(repo_path)
cheatsheets = repo.get_contents("pngs")

# extract a single random cheatsheet
# the first is ignored as it is a template
n_sheets = len(cheatsheets)
sheet_n = randint(1, n_sheets - 1)
sheet = cheatsheets[sheet_n]

# get the sheet name
path = sheet.path
name = path.removesuffix(".png")
name = name.removeprefix("pngs/")

# get the paths for  the various types (pdf and png)
raw_github = "https://raw.githubusercontent.com/rstudio/cheatsheets/master/"
dowload_png = "".join([raw_github, partial_path])
download_pdf = "".join([raw_github, "cheatsheets", "/", name, ".pdf"])
https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/data-import.png