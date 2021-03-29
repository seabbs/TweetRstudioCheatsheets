#!bin/bash
gcloud functions deploy post_cheatsheet  --memory=128MB --runtime python39 --trigger-http
