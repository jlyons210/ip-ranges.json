#!/usr/bin/env bash

# Quit if missing dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Retrieve and filter ip-ranges.json
./util-get-ip-ranges-json.sh
jq -c "[.prefixes[] | .service] | unique" ip-ranges.json
