#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.prefixes[] | select(.service == \"${1^^}\") | .region] | unique"
else
    printf "Must specify a service name:\n$0 [aws-service]\n"
fi

