#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.ipv6_prefixes[] | select(.region == \"$1\") | .ipv6_prefix] | unique"
else
    echo "Must specify a region name."
fi

