#!/usr/bin/env bash

# Check if the monitor is connected with hyprctl json output
if hyprctl -j monitors | jq 'any(.[]; .name == "HDMI-A-1")' | grep -q true; then
    hyprctl keyword monitor eDP-1,disable
    pidof waybar && killall waybar
    waybar -c ~/.config/waybar/hdmi_config &
else
    systemctl suspend
fi
