#!/bin/bash

CHANGE_BRIGHTNESS=$1

# Get the brightness value from the monitor
CURRENT_BRIGHTNESS=$(ddcutil getvcp 10 | awk '{print $9}')

# remove comma from the brightness value
CURRENT_BRIGHTNESS=${CURRENT_BRIGHTNESS//,}

# check if the brightness value is empty
# if it is empty, set the brightness to 50

if [[ -z "$CURRENT_BRIGHTNESS" ]]; then
    ddcutil setvcp 10 50
    exit 0
fi

# check if the brightness value is less than 0
