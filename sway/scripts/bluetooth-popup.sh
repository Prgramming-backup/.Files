#!/bin/bash

blueman-manager &

# Give the window time to appear
sleep 0.5

# Focus Blueman
swaymsg '[app_id="blueman-manager"] focus'

# Wait until Blueman loses focus
while swaymsg -t get_tree | jq -e '
    .. | objects |
    select(.app_id? == "blueman-manager" and .focused? == true)
' >/dev/null 2>&1; do
    sleep 0.2
done

# Close Blueman
pkill -x blueman-manager
