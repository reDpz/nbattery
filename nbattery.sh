#!/bin/bash

BATTERY_DIR="/sys/class/power_supply/BAT0"

_get_battery_status() {
    local _current_status=$(cat $BATTERY_DIR/status)
	local _current_capacity=$(cat $BATTERY_DIR/capacity)

    if [ "$_current_capacity" -le "10" ]; then
        printf 󰁺
    elif [ "$_current_capacity" -le "20" ]; then
        printf 󰁻
    elif [ "$_current_capacity" -le "30" ]; then
        printf 󰁼
    elif [ "$_current_capacity" -le "40" ]; then
        printf 󰁽 
    elif [ "$_current_capacity" -le "50" ]; then
        printf 󰁾
    elif [ "$_current_capacity" -le "60" ]; then
        printf 󰁿
    elif [ "$_current_capacity" -le "70" ]; then
        printf 󰂀
    elif [ "$_current_capacity" -le "80" ]; then
        printf 󰂁
    elif [ "$_current_capacity" -le "90" ]; then
        printf 󰂂
    else
        printf 󰁹
    fi

    # Here I've changed the charging symbol from  to 󱐋 because the latter is much more readable
    if [ "$_current_status" = "Charging" ]; then
        printf 󱐋
    # this else statement just makes sure that the spacing between the battery number and the battery icon stays consistent
    else
        printf " "
    fi

    # another small modification to just allow me to see the current battery status, I thought that if this program is already fetching and storing the value there is no need for me to run a seperate command to see it.
    # If you dont want it you can disable it by commenting it out with a "#"
    printf "$_current_capacity"
}

_get_battery_status
