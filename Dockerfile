## Start rocker r image
FROM rocker/r-ver:3.4.4

MAINTAINER "Sam Abbott" contact@samabbott.co.uk


## Get cron for scheduling
RUN apt-get update && apt-get -y install cron

## Install R packages - packrat
RUN Rscript -e 'install.packages("packrat"); packrat::restore()'
