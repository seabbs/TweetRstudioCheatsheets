#!bin/bash
gcloud functions deploy post_cheatsheet --source post_cheatsheet.py --region europe-west1 --project seabbs-personal  --memory=128MB --env-vars-file .env.yaml --runtime python39 --trigger-http
