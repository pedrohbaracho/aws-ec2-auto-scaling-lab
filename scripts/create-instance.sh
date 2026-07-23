#!/bin/bash

# Variables
KEY_NAME="MyKeyPair"
AMI_ID="ami-xxxxxxxxxxxxxxxxx"
INSTANCE_TYPE="t3.micro"
SECURITY_GROUP="sg-xxxxxxxxxxxxxxxxx"
SUBNET_ID="subnet-xxxxxxxxxxxxxxxxx"
USER_DATA="./userdata.sh"

echo "Creating EC2 instance..."

INSTANCE_ID=$(aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --subnet-id "$SUBNET_ID" \
    --associate-public-ip-address \
    --user-data file://$USER_DATA \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]' \
    --query "Instances[0].InstanceId" \
    --output text)

echo "EC2 Instance created:"
echo "$INSTANCE_ID"