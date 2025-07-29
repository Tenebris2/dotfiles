#!/bin/bash

# Max volume limit (e.g., 100%)
MAX_VOL=65536  # 100% in raw volume units

# Get current volume of the default sink
SINK="@DEFAULT_SINK@"
CURRENT_VOL=$(pactl get-sink-volume "$SINK" | awk '/Front Left:/ {print $5}' | tr -d '%')
# Increase volume only if it's below limit
if [ "$CURRENT_VOL" -lt 100 ]; then
    pactl set-sink-volume "$SINK" +5%
else
    pactl set-sink-volume "$SINK" 100%
fi
