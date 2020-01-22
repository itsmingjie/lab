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
TIME=$(TZ=":US/Eastern" date +"%D %T")

PREV_TIME=$(cat online.tmp)

echo $TIME > online.tmp

# CPU Temperature
CPU_TEMP=$(</sys/class/thermal/thermal_zone0/temp)
CPU_TEMP_H=$(echo "$((CPU_TEMP/1000*9/5 + 32))°F")

IP=$(hostname --ip-address)
ONLINE_MSG=":arrow_up: *$HOSTNAME* is checking in online at $TIME, current CPU temperature *$CPU_TEMP_H*. Previous check-in occured at $PREV_TIME."

echo $ONLINE_MSG

curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$ONLINE_MSG"'"}' $HOOK