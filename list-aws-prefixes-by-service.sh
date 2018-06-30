#!/usr/bin/env bash
#### Lists AWS IPv4 prefixes assigned to a specified AWS service using the public ip-ranges.json file.
#### Author: Jeremy Lyons - jlyons210@gmail.com

# Check dependencies
if ! ./util-check-dependency.sh date jq stat wget; then exit 1; fi

# Check for required arguments
if [ $# -eq 0 ]; then
  echo "ERROR: Must specify a service name: $0 [aws-service]" >&2
  exit 1
fi

# Retrieve json and parse
./util-get-ip-ranges-json.sh
jq -c "{ prefixes: [.prefixes[] | select(.service == \"${1^^}\") | { prefix: .ip_prefix}] | unique }" ip-ranges.json
