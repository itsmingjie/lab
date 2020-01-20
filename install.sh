#!/bin/bash

# Install service

echo "# post status message after networking is up" >> cat /etc/network/interfaces
echo "post-up /home/mingjie/lab/online.sh" >> cat /etc/network/interfaces