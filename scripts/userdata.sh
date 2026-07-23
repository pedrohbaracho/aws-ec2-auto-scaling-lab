#!/bin/bash

yum update -y

yum install -y httpd php

systemctl enable httpd
systemctl start httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE=$(curl -H "X-aws-ec2-metadata-token:$TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.php
<html>
<head>
<title>AWS Auto Scaling Lab</title>
</head>
<body style="font-family:Arial;text-align:center;margin-top:80px;">
<h1>AWS Auto Scaling Lab</h1>
<h2>EC2 Instance</h2>
<h3>$INSTANCE</h3>
</body>
</html>
EOF