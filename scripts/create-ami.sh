#!/bin/bash

INSTANCE_ID="$1"

if [ -z "$INSTANCE_ID" ]; then
    echo "Usage:"
    echo "./create-ami.sh <instance-id>"
    exit 1
fi

echo "Creating AMI..."

aws ec2 create-image \
    --instance-id "$INSTANCE_ID" \
    --name "WebServerAMI" \
    --description "AMI created for Auto Scaling Lab"