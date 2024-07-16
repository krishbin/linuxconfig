#! /usr/bin/env bash

option=$1

NOTIFACTION_TIMEOUT=2000

function help() {
    echo "Usage: screenshot.sh [option]"
    echo "Options:"
    echo "  -s, --select    Select a region to capture"
    echo "  -w, --window    Select a window to capture"
    echo "  -f, --full      Capture the full screen"
    echo "  -c, --clipboard Copy the screenshot to the clipboard"
    echo "  -h, --help      Display this help message"
}

function grab_active_window() {
    local active_window=`hyprctl -j activewindow`
    local box=$(echo $active_window | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | cut -f1,2 -d' ')
    echo "$box"
}

if [ -z $option ]; then
    help
    exit 1
fi

mkdir -p ~/Pictures/Screenshots
file=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S_grim).png

function notify() {
    notify-send -i $file "Screenshot" "Screenshot saved to $file" -t $NOTIFACTION_TIMEOUT
}
case $option in
    -s|--select)
        grim -g "$(slurp)" $file
        cat $file | wl-copy -t image/png
        notify
        ;;
    -w|--window)
        grim -g "$(grab_active_window)" $file
        cat $file | wl-copy -t image/png
        notify
        ;;
    -f|--full)
        grim -g "$(slurp -o)" $file
        cat $file | wl-copy -t image/png
        notify
        ;;
    -c|--clipboard)
        grim -g "$(slurp)" - | wl-copy -t image/png
        notify
        ;;
    -h|--help)
        help
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac
