#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.prefixes[] | select(.service == \"$1\") | .region] | unique"
else
    echo "Must specify a service name."
fi

