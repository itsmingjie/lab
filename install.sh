#!/bin/bash

# Install service

sudo echo "# post status message after networking is up" >> cat /etc/network/interfaces
sudo echo "post-up /home/mingjie/lab/online.sh" >> cat /etc/network/interfaces