# ip-ranges.json

I wrote this set of scripts to give myself some repetitions with git (it's my first Github project), jq and to dust off my shell scripting abilities. There probably isn't a lot of use for them, but it has been a fun exercise for me.

----
## To-do:
* Add count* scripts. - does jq have a countKeys or countObjects method of some kind?
* Add stdin pipeline support.
* ~~Add --help argument to list-aws-* scripts.~~
* ~~Trim out the *-by-* scripts using util-arg-is-*.sh scripts.~~
* ~~Develop some snazzy logic to detect valid aws-service and aws-region names as arguments~~.
* ~~Look for existence of curl and jq command line tools.~~
* ~~Download ip-ranges.json once per 24 hours, cache locally.~~
* ~~Create list-aws-prefixes-v6-by-service.sh~~

----
## Bugs:
* ./list-aws-prefixes.sh: when searching by region and service, an invalid argument on either side is ignored rather than reported.
