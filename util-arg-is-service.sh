#!/usr/bin/env bash
#### Determines whether a specified argument exists as an AWS service using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Check for required arguements
if [ $# -eq 0 ]; then
  echo "ERROR: Must specify a service name: $0 [aws-service]" >&2
  exit 1
fi

## Retrieve json and parse
./util-get-ip-ranges-json.sh
if [[ -z $(./list-aws-services.sh | jq -c ".services[] | select(.service == \"${1^^}\") | length") ]]; then
  ## If this returns a null value, arguement is not an AWS service
  exit 1
fi
