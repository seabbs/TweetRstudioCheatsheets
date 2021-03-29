#!bin/bash
gcloud functions deploy post_cheatsheet  --memory=256MB --env-vars-file .env.yaml --runtime python39 --trigger-http
