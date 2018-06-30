#!/usr/bin/env bash
#### Lists AWS services deployed in a specified region using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

# Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Check for required arguements
if [ $# -eq 0 ]; then
  echo "ERROR: Must specify a region name: $0 [aws-region]" >&2
  exit 1
fi

# Retrieve json and parse
./util-get-ip-ranges-json.sh
jq -c "{ services: [.prefixes[] | select(.region == \"$1\") | { service: .service }] | unique }" ip-ranges.json
