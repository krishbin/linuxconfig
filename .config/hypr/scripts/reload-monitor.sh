#!/usr/bin/env bash

# Check if the monitor is connected with hyprctl json output
if hyprctl -j monitors | jq 'any(.[]; .name == "HDMI-A-1")' | grep -q true; then
    hyprctl keyword monitor HDMI-A-1,disable
    sleep 1
    hyprctl keyword monitor HDMI-A-1,1920x1080@75,0x0,1
    hyprctl keyword monitor eDP-1,1920x1080@144,1920x0,1
    pidof waybar && killall waybar
    waybar &
    notify-send "Monitor reloaded" --icon=dialog-information
fi
