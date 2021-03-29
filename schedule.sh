#!bin/bash
gcloud scheduler jobs create pubsub post_cheatsheet \
    --schedule="0 6 * * *" \
    --topic=post-cheatsheet \
    --description="Post a daily #rstats cheatsheet to @daily_r_sheets" \
    --message-body="Post a cheatsheet"
