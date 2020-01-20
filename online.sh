#!/bin/bash

cd /home/mingjie/lab/

# Read environment variables from .env files
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

# Load Webhook
HOOK=$(read_var LAB_HOOK .env)

# Script to run after establishing remote connection

IP=$(hostname --ip-address)
ONLINEMSG=":arrow_up: *$HOSTNAME* is online at *$IP*. "

echo $ONLINEMSG

curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$ONLINEMSG"'"}' $HOOK