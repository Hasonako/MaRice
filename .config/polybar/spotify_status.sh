#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
elif [ "$status" = "Paused" ]; then
    echo " Paused"
else
    echo ""
fi