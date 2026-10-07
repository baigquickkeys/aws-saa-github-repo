#!/usr/bin/env bash
# Lab 1 — IAM, via AWS CLI
# Assumes `aws configure` has already run with an IAM user's credentials, not root.
set -euo pipefail

aws iam create-group --group-name Developers

aws iam attach-group-policy \
  --group-name Developers \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# dev-ec2-policy.json: Allow ec2:Start/StopInstances with Condition on aws:ResourceTag/Env=dev
aws iam create-policy \
  --policy-name DevEC2DevTag \
  --policy-document file://dev-ec2-policy.json

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws iam attach-group-policy \
  --group-name Developers \
  --policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/DevEC2DevTag"

aws iam create-role \
  --role-name ec2-s3-read-role \
  --assume-role-policy-document file://trust-policy.json

aws iam create-instance-profile --instance-profile-name ec2-s3-read-profile

aws iam add-role-to-instance-profile \
  --instance-profile-name ec2-s3-read-profile \
  --role-name ec2-s3-read-role

echo "Done. Verify with: aws iam list-attached-group-policies --group-name Developers"
