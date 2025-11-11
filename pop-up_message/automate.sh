#!/usr/bin/env bash

# Ensure environment for GUI notification
export DISPLAY=:0
export XAUTHORITY=/home/maheshraj/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Check if user is logged in (GUI session)
if ! loginctl list-sessions | grep -q $(whoami); then
    exit 0
fi

# Get timezone and current date/time
TIMEZONE=$(timedatectl show -p Timezone --value)
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Trigger popup
notify-send "Hello, $(whoami)!" "Local time ($TIMEZONE): $CURRENT_TIME"

