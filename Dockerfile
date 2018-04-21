## Start rocker r image
FROM rocker/r-ver:3.4.4

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

## Get cron for scheduling
RUN apt-get update && apt-get -y install cron && cron start

## Install R packages - packrat
RUN Rscript -e 'install.packages("packrat"); packrat::restore()'

## Run bot scheduling on docker run 
CMD Rscript -e schedule_bot.R
