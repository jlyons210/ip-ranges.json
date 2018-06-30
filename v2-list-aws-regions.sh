#!/usr/bin/env bash
#### Lists all AWS regions using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

## Retrieve json and parse
./util-get-ip-ranges-json.sh

if [[ $# -eq 0 ]]; then
  ## Show all regions
  jq -c "{ regions: [.prefixes[] | { region: .region }] | unique }" ip-ranges.json
else
  ## Show regions running $1
  ./util-arg-is-service.sh $1
  if [ $? -eq 0 ]; then
    jq -c "{ regions: [.prefixes[] | select(.service == \"${1^^}\") | { region: .region }] | unique }" ip-ranges.json
  else
    echo "ERROR: Invalid argument provided: $1" >&2
    echo "USAGE: $0 [aws-service]"
  fi
fi
