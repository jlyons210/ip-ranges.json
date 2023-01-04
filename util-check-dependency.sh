#!/usr/bin/env bash
#### Checks for the installation of any number of command line utilities as arguments.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Set initial error status
ERR=0

## Loop through command line arguments
for VAR in $@
do
  if [ ! -x "$(command -v $VAR)" ]; then
    ## Throw error for each command not installed and set error status
    echo "ERROR: $VAR is not installed!" >&2
    ERR=1
  fi
done

## Exit, return error status
exit $ERR
