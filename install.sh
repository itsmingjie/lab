#!/bin/bash

# Install service

sudo systemctl link /home/mingjie/lab/pi-online.service
sudo systemctl enable pi-online.service
sudo systemctl start pi-online.service