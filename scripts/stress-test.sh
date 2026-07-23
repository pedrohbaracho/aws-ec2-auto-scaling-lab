#!/bin/bash

echo "Installing stress..."

sudo yum install -y stress

echo "Generating CPU load..."

stress --cpu 4 --timeout 600