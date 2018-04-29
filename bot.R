## Load packages required by bot
library(magrittr)
library(stringr)
library(glue)
library(rtweet)

getwd()

## Reset workdir for scheduled job docker - not ideal
if (!grepl("TweetRstudioCheatsheets", getwd())) {
  if (dir.exists("TweetRstudioCheatsheets")) {
    setwd("TweetRstudioCheatsheets")
    }else{
      setwd("/home/TweetRstudioCheatsheets")
    }
  
}

## Clone the cheetsheet repo if it doesn't already exist
if (!dir.exists("cheatsheets")) {
  system("git clone https://github.com/rstudio/cheatsheets.git")
}

## Get new updates to the cheetsheet repo
system("cd cheatsheets && git pull")

## Get the list of all cheatsheets
cheatsheets <- list.files(path = "cheatsheets", 
                          pattern = "*.pdf")

## Get the name of the previously used sheet if it exists
if (file.exists("storage/yesterdays_cheatsheet.rds")) {
  yesterdays_cheatsheet <- readRDS("storage/yesterdays_cheatsheet.rds")
}else{
  yesterdays_cheatsheet <- ""
}

## Excluded yesterdays cheatsheet and template cheatsheet from list
cheatsheets <- setdiff(cheatsheets, 
                       c("0-template.pdf", yesterdays_cheatsheet))

## Randomly select today's cheatsheet
todays_cheatsheet <- sample(cheatsheets, 1)
  
## Save as yesterdays cheatsheet
saveRDS(todays_cheatsheet, "storage", "yesterdays_cheatsheet.rds")

## Make the cheatsheets name pretty
pretty_cheatsheet <- todays_cheatsheet %>% 
  str_remove(".pdf") %>% 
  str_replace("-", " ")

## Get 
## Make tweet text
tweet_text <- glue("Today's #rstats cheatsheet: {pretty_cheatsheet}
                   Download: https://github.com/rstudio/cheatsheets/raw/master/{todays_cheatsheet}
                   See more: https://www.rstudio.com/resources/cheatsheets/
                   Contribute your own: https://github.com/rstudio/cheatsheets")

## Full file path for cheatsheet (png)
cheatsheet_path <- todays_cheatsheet %>% 
  str_replace(".pdf", ".png") %>% 
  {file.path(getwd(), "cheatsheets", "pngs", .)}

token_path <- file.path(getwd(), "storage", "twitter_token.rds")

if (file.exists(token_path)) {
  ## Post tweet
  post_tweet(status = tweet_text,
             media = cheatsheet_path,
             token = readRDS(token_path))
}else {
  warning("Tweet not posted as twitter_token.rds not found.")
}

