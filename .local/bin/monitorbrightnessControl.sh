#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a
# ddcutil getvcp 10
#VCP code 0x10 (Brightness                    ): current value =    25, max value =   100

cur_brightness=$(ddcutil getvcp 10 | awk '{print $9}' | sed 's/,//')

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$cur_brightness
  dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Monitor Brightness: $brightness%" -t 2000
}

case $1 in
  up)
    # increase the backlight by 5%
    cur_brightness=$((cur_brightness + 5))
    ddcutil setvcp 10 $cur_brightness
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    cur_brightness=$((cur_brightness - 5))
    ddcutil setvcp 10 $cur_brightness
    send_notification
    ;;
esac
