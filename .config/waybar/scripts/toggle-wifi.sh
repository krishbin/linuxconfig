#! /bin/bash

# Check if the wifi is on or off
if [ $(nmcli radio wifi) = 'enabled' ]; then
    nmcli radio wifi off
    notify-send "Disabling WiFi"
else
    nmcli radio wifi on
    notify-send "Enabling WiFi"
fi
