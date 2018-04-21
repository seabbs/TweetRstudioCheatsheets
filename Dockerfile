## Start rocker r image
FROM rocker/r-ver:3.4.4

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

## Get cron for scheduling
RUN apt-get update && apt-get -y install cron && cron start

## Get libs required by packages
RUN apt-get install -y \
	libssl-dev \
    libcurl4-openssl-dev \
    && apt-get clean

## Install R packages
RUN Rscript -e 'install.packages(c("magrittr", "stringr", "glue", "rtweet", "cronR"))'

## Run the bot once to initialise
CMD Rscript -e bot.R

## Run bot scheduling - daily
CMD Rscript -e schedule_bot.R
