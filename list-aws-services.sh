#!/usr/bin/env bash
#### Lists all AWS services using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

## Retrieve json and parse
./util-get-ip-ranges-json.sh

if [[ $# -eq 0 ]]; then
  ## Show all services
  jq -c "{ services: [.prefixes[] | { service: .service }] | unique }" ip-ranges.json

## --help?
elif ./util-arg-is-help.sh $@; then
  echo "USAGE: $0 [aws-region]"

else
  ## Show services running $1
  ./util-arg-is-region.sh ${1,,}
  if [ $? -eq 0 ]; then
    jq -c "{ services: [.prefixes[] | select(.region == \"${1,,}\") | { service: .service }] | unique }" ip-ranges.json
  else
    echo "ERROR: Invalid argument: $1" >&2
    echo "USAGE: $0 [aws-region]"
  fi
fi
