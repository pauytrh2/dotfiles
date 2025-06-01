#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null; then
    # If running, kill the waybar process
    pkill -x "waybar"
    kitty sh $(waybar) &
else
    # If not running, start waybar
    kitty sh $(waybar) &
fi