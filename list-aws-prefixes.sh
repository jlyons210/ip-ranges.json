#!/usr/bin/env bash
#### Lists all AWS IPv4 prefixes  using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

## Retrieve json and parse
./util-get-ip-ranges-json.sh

## Show all prefixes
if [[ $# -eq 0 ]]; then
  jq -c "{ prefixes: [{ prefix: .prefixes[].ip_prefix }] }" ip-ranges.json

## --help?
elif ./util-arg-is-help.sh $@; then
  echo "USAGE: $0 [aws-region] [aws-service]"

else
  REGION=""
  SERVICE=""

  for var in $@
  do
    ## Flip flag if $var is a valid region
    ./util-arg-is-region.sh ${var,,}
    if [[ $? -eq 0 ]]; then REGION="${var,,}"; fi

    ## Flip flag if $var is a valid service
    ./util-arg-is-service.sh ${var^^}
    if [[ $? -eq 0 ]]; then SERVICE="${var^^}"; fi
  done

  ## Show IP prefixes filtered by both region and service
  if [[ ! -z $REGION && ! -z $SERVICE ]]; then
    jq -c "{ prefixes: [.prefixes[] | select(.region == \"$REGION\" and .service == \"$SERVICE\") | { prefix: .ip_prefix }] | unique }" ip-ranges.json

  ## Show IP prefixes filtered by region
  elif [[ ! -z $REGION ]]; then
    jq -c "{ prefixes: [.prefixes[] | select(.region == \"$REGION\") | { prefix: .ip_prefix }] | unique }" ip-ranges.json

  ## Show IP prefixes filtered by service
  elif [[ ! -z $SERVICE ]]; then
    jq -c "{ prefixes: [.prefixes[] | select(.service == \"$SERVICE\") | { prefix: .ip_prefix }] | unique }" ip-ranges.json

  ## Show usage
  else
    echo "ERROR: Invalid argument: $1" >&2
    echo "USAGE: $0 [aws-region] [aws-service]"
  fi
fi
