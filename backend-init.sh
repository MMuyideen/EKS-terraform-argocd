#!/bin/bash

S3_BUCKET_NAME="week4-todo-tf-s3"
DB_TABLE_NAME="week4-todo-tf-db"

# Create S3 bucket
aws s3api create-bucket \
  --bucket $S3_BUCKET_NAME \
  --region us-east-1


aws eks update-kubeconfig --region us-east-1 --name deen-ToDo-App