#!/bin/sh

#Home monitor
#description: Dell Inc. DELL S2721HN 54TF193

handle() {
    connected_monitor="`hyprctl monitors | grep serial | grep -E '54TF193' | cut -d ':' -f 2 | tr -d ' '`"
    if [[ "$connected_monitor" == "54TF193" ]]; then
        case $1 in monitoradded*)
            hyprctl dispatch moveworkspacetomonitor "1 1"
            hyprctl dispatch moveworkspacetomonitor "2 0"
            hyprctl dispatch moveworkspacetomonitor "3 1"
        esac
    else
        case $1 in monitoradded*)
            hyprctl dispatch moveworkspacetomonitor "1 0"
            hyprctl dispatch moveworkspacetomonitor "2 1"
            hyprctl dispatch moveworkspacetomonitor "3 1"
        esac
    fi
}

handle

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
