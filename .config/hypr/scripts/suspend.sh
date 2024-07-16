#! /bin/bash
pw-cli i all 2>&1 | rg running -q
# only suspend if audio isn't running
if [ $? == 1 ]; then
    pidof steam || systemctl suspend || loginctl suspend
    notify-send "Suspending system" "System is going to suspend"
fi
