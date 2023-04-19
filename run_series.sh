#!/bin/bash

# ###########################################################
#
# PARSE INPUT

usage="
Usage: $(basename "$0") [-h] -s series -i iterations

where:
    -s  series folder in experiments
    -i  iterations
    "

series=""
iterations=""
while getopts 'hs:i:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) series=$OPTARG
       ;;
    i) iterations=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

if [ -z "$series" -o -z "$usage" ]; then
  echo "$usage" >&2
  exit 1
fi

# BUILD CONFIG

config=experiments/$series/config


# EXECUTE
echo "=================================================="
echo "= "
echo "= $series"
echo "= "
echo "=================================================="

for experiment in `find experiments/$series | grep .xml | sed 's/.xml//' | sed 's/.*\///'`
do

  echo "== Running: $experiment"
  ./run_experiment.sh -s $series -e $experiment -i $iterations

done





