## Start rocker r image
FROM rocker/r-ver:3.4.4

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

## Get cron for scheduling
RUN apt-get update && apt-get -y install cron

## Get libs required by packages
RUN apt-get install -y \
	libssl-dev \
    libcurl4-openssl-dev \
    git \
    && apt-get clean

## Install R packages - MRAN
RUN Rscript -e 'install.packages(c("magrittr", "stringr", "glue", "rtweet", "cronR"))'

ADD . home/TweetRstudioCheatsheets

WORKDIR  home/TweetRstudioCheatsheets

## Create log file
RUN touch bot.log

## Run the bot once to initialise, schedule and hold open the container
CMD Rscript bot.R \\
    && service cron start \\
	&& Rscript schedule_bot.R \\
	&& tail -f bot.log
