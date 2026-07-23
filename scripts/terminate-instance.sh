#!/bin/bash

INSTANCE_ID="$1"

if [ -z "$INSTANCE_ID" ]; then
    echo "Usage:"
    echo "./terminate-instance.sh <instance-id>"
    exit 1
fi

aws ec2 terminate-instances \
    --instance-ids "$INSTANCE_ID"