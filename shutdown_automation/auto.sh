#!/bin/bash

# Threshold in milliseconds (15 minutes = 15 * 60 * 1000)
THRESHOLD=$((15 * 60 * 1000))

# Infinite loop to check every minute
while true; do
    # Get idle time in milliseconds
    idle_time=$(xprintidle)

    # Compare with threshold
    if [ "$idle_time" -ge "$THRESHOLD" ]; then
        echo "No activity for 15 minutes. Shutting down..."
        sudo poweroff
        exit 0
    fi

    # Wait for 60 seconds before checking again
    sleep 60
done

#save this file in /usr/local/bin/auto.sh and give execute permissions with:
# sudo chmod +x /usr/local/bin/auto.sh