#!bin/bash
gcloud functions deploy post_cheatsheet --region europe-west1 --project seabbs-personal  --memory=128MB --runtime python39 --trigger-http
