#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness {
    light -G |  cut -d '.' -f 1
}

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$(get_brightness)
  dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Brightness: $brightness%" -t 2000
}

case $1 in
  up)
    # increase the backlight by 5%
    light -A 5
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    light -U 5
    send_notification
    ;;
esac
