#!/bin/bash

S3_BUCKET_NAME="week4-todo-tf-s3"
DB_TABLE_NAME="week4-todo-tf-db"

terraform destroy -auto-approve

# empty bucket
aws s3 rb s3://$S3_BUCKET_NAME \
    --force

# delete s3 bucket
aws s3api delete-bucket \
    --bucket $S3_BUCKET_NAME \
    --region us-east-1