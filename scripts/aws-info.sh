#!/bin/bash

echo "Current AWS Identity"
aws sts get-caller-identity

echo ""

echo "Running EC2 Instances"
aws ec2 describe-instances \
--query "Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]" \
--output table

echo ""

echo "Available AMIs"

aws ec2 describe-images \
--owners self \
--query "Images[*].[ImageId,Name]" \
--output table