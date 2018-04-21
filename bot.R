## Load packages required by bot
library(magrittr)
library(stringr)
library(glue)
library(rtweet)

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
if (file.exists("yesterdays_cheatsheet.rds")) {
  yesterdays_cheatsheet <- readRDS("yesterdays_cheatsheet.rds")
}else{
  yesterdays_cheatsheet <- ""
}

## Excluded yesterdays cheatsheet and template cheatsheet from list
cheatsheets <- setdiff(cheatsheets, 
                       c("0-template.pdf", yesterdays_cheatsheet))

## Randomly select today's cheatsheet
todays_cheatsheet <- sample(cheatsheets, 1)
  
## Save as yesterdays cheatsheet
saveRDS(todays_cheatsheet, "yesterdays_cheatsheet.rds")

## Make the cheatsheets name pretty
pretty_cheatsheet <- todays_cheatsheet %>% 
  str_remove(".pdf") %>% 
  str_replace("-", " ")

## Make tweet text
tweet_text <- glue("Today's #rstats cheatsheet: {pretty_cheatsheet}
                   See more: https://www.rstudio.com/resources/cheatsheets/
                   Contribute your own: https://github.com/rstudio/cheatsheets")

## Full file path for cheatsheet
cheatsheet_path <- file.path(getwd(), "cheatsheets", todays_cheatsheet)

token_path <- file.path(getwd(), "twitter_token.rds")

## Post tweet
post_tweet(status = tweet_text,
           media = cheatsheet_path,
           twitter_token = token_path)
