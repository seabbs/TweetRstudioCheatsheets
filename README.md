Tweet Rstudio Cheatsheets
==========

A [twitter bot](https://twitter.com/https://twitter.com/daily_r_sheets) that posts a random #rstats cheatsheet each day. Sourced from Rstudio - no affiliation. Developed by [seabbs](https://github.com/seabbs)

Set-up
------

This bot has been set-up to run as a self contained [docker](https://www.docker.com) container using the following process,

1. Clone the repository

``` bash
git clone https://github.com/seabbs/TweetRstudioCheatsheets.git
```

1. Authorise the bot by setting up a twitter token. Instructions for this can be found [here](https://cran.r-project.org/web/packages/rtweet/vignettes/auth.html). Add the saved token (as `twitter_token.rds`) to the `TweetRstudioCheatsheets` repository.

1. Navigate to the `TweetRstudioCheatsheets` and build the docker container.

``` bash
docker build . -t daily_r_cheatsheets
```

1. Run the docker container

``` bash
docker run -d --name daily_r_cheatsheets daily_r_cheatsheets
```
