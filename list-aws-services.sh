#!/usr/bin/env bash

curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -c '[.prefixes[] | .service] | unique'

