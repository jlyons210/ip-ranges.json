#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.prefixes[] | select(.service == \"${1^^}\") | .ip_prefix] | unique"
else
    printf "Must specify a region name:\n$0 [aws-region]\n"
fi

