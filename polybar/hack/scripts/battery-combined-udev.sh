#!/bin/bash

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0

    critical=10
    low=35
    medium=50
    high=75
    veryhigh=88

    BLUE=#057eff
    LIME=#00ff00
    CRITICAL=#fdd835

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ]; then
        battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
    fi

    if [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ]; then
        battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
    fi

    if [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
    fi

    battery_level=$(("$battery_level_0 + $battery_level_1"))
    battery_max=$(("$battery_max_0 + $battery_max_1"))

    battery_percent=$(("$battery_level * 100"))
    battery_percent=$(("$battery_percent / $battery_max"))

    if [ "$ac" -eq 1 ]; then
        if [ "$battery_percent" -gt $veryhigh ]; then
            echo -e "FULL %{F#43a047}󰂄 %{F-}$battery_percent%"
	elif [ "$battery_percent" -gt $high ]; then
	    echo -e "%{F$LIME}󱊦 %{F-}$battery_percent%"
   	elif [ "$battery_percent" -gt $medium ]; then
            echo -e "%{F$LIME}󱊥 %{F-}$battery_percent%"
	elif [ "$battery_percent" -gt $low ]; then
	    echo -e "%{F$LIME}󱊤 %{F-} $battery_percent%"
	else
	    echo -e "%{F$LIME}󰢟 %{F-} $battery_percent%"
        fi

    else
	if [ "$battery_percent" -gt $veryhigh ]; then
	    icon="󰁹"
        elif [ "$battery_percent" -gt $high ]; then
            icon="󱊣"
        elif [ "$battery_percent" -gt $medium ]; then
            icon="󱊢"
        elif [ "$battery_percent" -gt $low ]; then
            icon="󱊡"
        elif [ "$battery_percent" -gt $critical ]; then
            icon="󰂎"
        else
            icon="%{F$critical}󰂃"
        fi

        echo -e "%{F#E42022} $icon%{F-} $battery_percent%"
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 1 &
            wait
        done
        ;;
esac
