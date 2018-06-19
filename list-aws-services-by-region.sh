#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.prefixes[] | select(.region == \"$1\") | .service] | unique"
else
    echo "Must specify a region name."
fi

