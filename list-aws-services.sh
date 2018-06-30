#!/usr/bin/env bash
#### Lists all AWS services using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

# Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Retrieve json and parse
./util-get-ip-ranges-json.sh
jq -c "{ services: [.prefixes[] | { service: .service }] | unique }" ip-ranges.json
