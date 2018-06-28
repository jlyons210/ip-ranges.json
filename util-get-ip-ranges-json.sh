#!/usr/bin/env bash

# If ip-ranges.json exists, refresh if older than 24 hours
if [ -f ip-ranges.json ]; then
    file_time=$(stat -c %Z ip-ranges.json)
    expire_time=$(date --date '-1 day' +%s)

    if [ $file_time -lt $expire_time ]; then
        rm ip-ranges.json
        wget -q https://ip-ranges.amazonaws.com/ip-ranges.json
    fi
else
    # If ip-ranges.json doesn't exist, download it
    wget -q https://ip-ranges.amazonaws.com/ip-ranges.json
fi
