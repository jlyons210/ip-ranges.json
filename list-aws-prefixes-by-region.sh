#!/usr/bin/env bash

# Quit if missing dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Quit if [aws-region] is not specified
if [ $# -eq 0 ]; then
    printf "Must specify a region name:\n$0 [aws-region]\n"
    exit 1
fi

# Retrieve and filter ip-ranges.json
./util-get-ip-ranges-json.sh
jq -c "[.prefixes[] | select(.region == \"$1\") | .ip_prefix] | unique" ip-ranges.json
