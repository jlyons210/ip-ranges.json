#!/usr/bin/env bash

err=0

for var in "$@"
do
    if [ ! -x "$(command -v $var)" ]; then
        printf "[ERROR] $var is not installed!\n" >&2
        err=1
    fi
done

exit $err
