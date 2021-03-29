#!bin/bash
gcloud functions deploy post_cheatsheet \
    --trigger-topic post-cheatsheet \
     --memory=256MB \
     --env-vars-file .env.yaml \
     --runtime python39
