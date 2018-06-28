#!/usr/bin/env bash

# Quit if missing dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Quit if [aws-service] is not specified
if [ $# -eq 0 ]; then
    printf "Must specify a service name:\n$0 [aws-service]\n"
    exit 1
fi

# Retrieve and filter ip-ranges.json
./util-get-ip-ranges-json.sh
jq -c "[.prefixes[] | select(.service == \"${1^^}\") | .ip_prefix] | unique" ip-ranges.json
