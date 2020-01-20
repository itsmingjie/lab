#!/bin/bash

# Install service

sudo echo "# post status message after networking is up" >> /etc/network/interfaces
sudo echo "post-up /home/mingjie/lab/online.sh" >> /etc/network/interfaces