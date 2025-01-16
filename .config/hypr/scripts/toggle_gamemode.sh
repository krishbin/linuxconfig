#!/usr/bin/env bash

args=("$@")

session=$(<~/.session-var)

function enable_gamemode {
    sed -i 's/Hyprland/gamescope-session/g' ~/.session-var
    notify-send "Gamemode Enabled" "Logging out of this session"
    sudo systemctl restart getty@tty1
}

function disable_gamemode {
    sed -i 's/gamescope-session/Hyprland/g' ~/.session-var
    notify-send "Gamemode Disabled"
}

if [[ ${args[0]} == "game" ]]; then
    enable_gamemode
elif [[ ${args[0]} == "desktop" ]]; then
    disable_gamemode
else
    if [[ "$session" == "Hyprland" ]]; then
        enable_gamemode
    elif [[ "$session" == "gamescope-session" ]]; then
        disable_gamemode
    else
        echo Hyprland > ~/.session-var
    fi
fi
