#!/usr/bin/env bash
#### Checks for the installation of any number of comand line utilities provided as arguements.
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Set initial error status
err=0

## Loop through command line arguements
for var in "$@"
do
  if [ ! -x "$(command -v $var)" ]; then
    ## Throw error for each command not installed and set error status
    echo "ERROR: $var is not installed!" >&2
    err=1
  fi
done

## Exit, return error status
exit $err
