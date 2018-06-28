#!/usr/bin/env bash

# Quit if missing dependencies
if [ ! -x $(./check-dependency.sh curl jq) ]; then exit 1; fi

# Quit if [aws-service] is not specified
if [ $# -eq 0 ]; then
    printf "Must specify a service name:\n$0 [aws-service]\n"
    exit 1
fi

# Let it rip!
curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c "[.prefixes[] | select(.service == \"${1^^}\") | .ip_prefix] | unique"
