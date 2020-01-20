#!/bin/bash

# Install service

sudo ln -s online.service /etc/systemd/system/pi-online.service
sudo systemctl enable pi-online.service
sudo systemctl start pi-online.service