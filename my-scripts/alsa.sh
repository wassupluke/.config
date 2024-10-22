#!/bin/bash

# Get volume level
volume=$(amixer get Master | grep -o '[0-9]\+%' | head -n 1 | tr -d '%')


# Define icons
mute_icon="🔇"
low_volume_icon="🔈"
medium_volume_icon="🔉"
high_volume_icon="🔊"

# Display icons based on volume level and mute status
if amixer get Master | grep -q '\[off\]'; then
    echo "$mute_icon"
elif [ "$volume" -lt "35" ]; then
    echo "$low_volume_icon$volume%"
elif [ "$volume" -lt "70" ]; then
    echo "$medium_volume_icon$volume%"
else
    echo "$high_volume_icon$volume%"
fi
