#!/usr/bin/env bash

############ Variables ############
location=$1
wifi_connected_icon="󰤨"
wifi_disconnected_icon="󰤭"
ethernet_connected_icon="󰈀"
ethernet_disconnected_icon="󰈀"
battery_charging_icon="󰂄"
battery_discharging_icon_1="󰁹"
battery_discharging_icon_2="󰂁"
battery_discharging_icon_3="󰁿"
battery_discharging_icon_4="󰁼"
battery_discharging_icon_5="󰁻"
battery_alert="󰂃"
battery_full_icon="󰁹"

####### Check availability ########
function left(){
    enable_battery=false
    battery_charging=false
    output=""
    for battery in /sys/class/power_supply/*BAT*; do
        if [[ -f "$battery/uevent" ]]; then
            enable_battery=true
            if [[ $(cat /sys/class/power_supply/*/status | head -1) == "Charging" ]]; then
                battery_charging=true
            fi
            break
        fi
    done

    if [[ $enable_battery == true ]]; then
        battery_percentage=$(cat /sys/class/power_supply/*/capacity | head -1)
        if [[ $battery_charging == true ]]; then
            output="$output Charging $battery_charging_icon $battery_percentage%"
        else
            if [[ $battery_percentage -le 20 ]]; then
                output="$output $battery_alert $battery_percentage%"
            elif [[ $battery_percentage -le 40 ]]; then
                output="$output $battery_discharging_icon_5 $battery_percentage%"
            elif [[ $battery_percentage -le 60 ]]; then
                output="$output $battery_discharging_icon_4 $battery_percentage%"
            elif [[ $battery_percentage -le 80 ]]; then
                output="$output $battery_discharging_icon_3 $battery_percentage%"
            elif [[ $battery_percentage -le 90 ]]; then
                output="$output $battery_discharging_icon_2 $battery_percentage%"
            elif [[ $battery_percentage -le 95 ]]; then
                output="$output $battery_discharging_icon_1 $battery_percentage%"
            else
                output="$output $battery_full_icon Fully Charged"
            fi
        fi
    fi
    echo -n "$output"
}

function right(){
    wifi_connected=false
    ethernet_connected=false
    if [[ $(nmcli -t -f DEVICE,STATE dev | grep -E '^wlp|^wlan' | cut -d':' -f2) == "connected" ]]; then
        wifi_connected=true
    fi
    if [[ $(nmcli -t -f DEVICE,STATE dev | grep -E '^enp|^eth|^eno' | cut -d':' -f2) == "connected" ]]; then
        ethernet_connected=true
    fi
    output=""
    if [[ $wifi_connected == true ]]; then
        wifi_name=$(nmcli -t -f NAME,DEVICE connection show --active | grep -E 'wlp|wlan' | cut -d':' -f1)
        output="$output $wifi_connected_icon $wifi_name"
    else
        output="$wifi_disconnected_icon Not Connected"
    fi
    if [[ $ethernet_connected == true ]]; then
        ethernet_name=$(nmcli -t -f NAME,DEVICE connection show --active | grep -E 'enp|eth|eno' | cut -d':' -f1)
        output="$output | $ethernet_connected_icon $ethernet_name"
    else
        output="$output | $ethernet_disconnected_icon Not Connected"
    fi
    echo -n "$output"

}

if [[ $location == "left" ]]; then
    left
elif [[ $location == "right" ]]; then
    right
fi

echo ''
