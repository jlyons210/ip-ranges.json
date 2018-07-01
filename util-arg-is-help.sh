#!/usr/bin/env bash
#### was --help specified?
#### Author: Jeremy Lyons - jlyons210@gmail.com

## Set initial statusa -- TODO: Need to get to a point where I agree that exit codes are aligned with bool or not.
NEED_HELP=1

## Loop through command line arguments
for VAR in $@
do
  if [[ $VAR == "--help" ]]; then NEED_HELP=0; break; fi
done

exit $NEED_HELP
