#!/bin/bash
set -ex
AWS_REGION="eu-west-1"
cd jenkins-packer-demo
S3_BUCKET="aws s3 ls --region $AWS_REGION | grep terraform-state |tail -n1 |cut -d ' ' -f3"
sed -i 's/terraform-state-rahul/'${S3_BUCKET}'/' backend.tf
sed -i 's/#//g' backend.tf
aws s3 cp '`s3://terraform-state-rahul/amivar.tf amivar.tf --region /$AWS_REGION`'
terraform init
terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -target aws_instance.app-instance
