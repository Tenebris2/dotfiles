#!/bin/bash
INTERFACE="wlo1"
if [[ $(nmcli -t -f DEVICE,STATE dev | grep "$INTERFACE" | cut -d':' -f2) == "connected" ]]; then
    SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    echo " $SSID"
else
    echo " Disconnected"
fi
