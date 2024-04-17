#!/bin/bash

# Get volume level
volume=$(amixer get Master | grep '%' | awk -F '[][]' '{print $2}')

# Check if muted
muted=$(amixer get Master | grep '%' | awk -F '[][]' '/\[off\]/{print "muted"}')

# Define icons
mute_icon="🔇"
low_volume_icon="🔈"
medium_volume_icon="🔉"
high_volume_icon="🔊"

# Display icons based on volume level and mute status
if [ "$muted" == "muted" ]; then
    echo "$mute_icon"
elif [ "$volume" -lt "35" ]; then
    echo "$low_volume_icon $volume"
elif [ "$volume" -lt "70" ]; then
    echo "$medium_volume_icon $volume"
else
    echo "$high_volume_icon $volume"
fi

