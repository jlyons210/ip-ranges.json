#!/usr/bin/env bash
#### Determines whether a specified AWS region exists using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Check for required arguments
if [ $# -eq 0 ]; then
  echo "ERROR: Must specify a region name: $0 [aws-region]" >&2
  exit 1
fi

## Retrieve json and parse
./util-get-ip-ranges-json.sh
if [[ -z $(./list-aws-regions.sh | jq -c ".regions[] | select(.region == \"${1,,}\") | length") ]]; then
  ## If this returns a null value, argument is not an AWS region
  exit 1
fi
