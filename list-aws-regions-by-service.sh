#!/usr/bin/env bash
#### Lists AWS regions with a specified AWS service deployed using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

# Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Check for required arguements
if [ $# -eq 0 ]; then
  echo "ERROR: Must specify a service name: $0 [aws-service]" >&2
  exit 1
fi

# Retrieve json and parse
./util-get-ip-ranges-json.sh
jq -c "{ regions: [.prefixes[] | select(.service == \"${1^^}\") | { region: .region }] | unique }" ip-ranges.json 
