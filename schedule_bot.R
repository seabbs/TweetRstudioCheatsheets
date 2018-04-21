## Load cronR
library(cronR)

## Get full path for bot
bot_path <- file.path(getwd(), "bot.R")

## Make rscript into cron
bot_cmd <- cronR::cron_rscript(bot_path, log_append = TRUE)

## Schedule
cron_add(bot_cmd, "daily",
         at = "12AM",
         description = "Post a random R cheatsheet daily")
