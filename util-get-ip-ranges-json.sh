#!/usr/bin/env bash
#### Retrieves the public AWS ip-ranges.json file if a local copy does not exist or it is older than 24 hours.
#### Author: Jeremy Lyons - jlyons210@gmail.com

# If ip-ranges.json exists, refresh if older than 24 hours
if [ -f ip-ranges.json ]; then
  file_time=$(stat -c %Z ip-ranges.json)
  expire_time=$(date --date '-1 day' +%s)

  if [ $file_time -lt $expire_time ]; then
    echo "INFO: Refreshing stale ip-ranges.json file."
    rm ip-ranges.json
    wget -q https://ip-ranges.amazonaws.com/ip-ranges.json
  fi
else
  # If ip-ranges.json doesn't exist, download it
  echo "INFO: Downloading new ip-ranges.json file."
  wget -q https://ip-ranges.amazonaws.com/ip-ranges.json
fi
