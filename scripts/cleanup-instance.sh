#!/bin/bash

echo "Cleaning logs..."

sudo rm -f /root/.bash_history
sudo rm -f /home/ec2-user/.bash_history

sudo yum clean all

history -c

echo "Done."