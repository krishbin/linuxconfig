#!/usr/bin/env sh

# Accept an arg '+' or '-'
direction=$1

# Get the current volume
current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP "\d+%" | sed 's/%//' | head -n1 )
current_volume_next=$(($current_volume + 5))


if [ "$direction" == "-" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$direction" == "+" ]; then
    if [ "$current_volume_next" -ge 150 ]; then
        pactl set-sink-volume @DEFAULT_SINK@ 150%
    else
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    fi
else
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi
