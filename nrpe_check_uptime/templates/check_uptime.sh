#!/bin/bash

CHECK_UPTIME_STRING=`uptime | awk '{print $4}' | sed 's/,//g'`
CURRENT_UPTIME=`uptime | awk '{ print $3 " " $4 }' | awk -F "," '{ print $1 }'`

check_uptime_min(){
    CHECK_UPTIME_NUMBER=`uptime | awk '{print $3}' | sed 's/,//g'`
    if (($CHECK_UPTIME_NUMBER < 10 )); then
        echo "CRITICAL - uptime ${CHECK_UPTIME_NUMBER} min"
        exit 2
    elif (($CHECK_UPTIME_NUMBER < 20 )); then
        echo "WARNING - uptime ${CHECK_UPTIME_NUMBER} min"
        exit 1
    else
        echo "OK - uptime ${CHECK_UPTIME_NUMBER} min"
        exit 0
    fi
}

if [[ "$CHECK_UPTIME_STRING" == "min" ]] 
then
        check_uptime_min
else
        echo "OK - uptime ${CURRENT_UPTIME}"
        exit 0
fi