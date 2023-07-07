#!/bin/bash

# ###########################################################
#
# PARSE INPUT

usage="
Usage: $(basename "$0") [-h] -s series -i iterations -l learner

where:
    -s  series folder in experiments
    -i  iterations
    -l learner
    "

series=""
iterations=""
learner=""
while getopts 'hs:i:l:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) series=$OPTARG
       ;;
    i) iterations=$OPTARG
       ;;
    l) learner=$OPTARG
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

if [ -z "$series" -o -z "$iterations" -o -z "$learner" ]; then
  echo "$usage" >&2
  exit 1
fi


# EXECUTE
echo "=================================================="
echo "= "
echo "= $series with $learner" 
echo "= "
echo "=================================================="

for experiment in `find experiments/$series | grep .xml | sed 's/.xml//' | sed 's/.*\///'`
do

  echo "== Running: $experiment"
  ./run_experiment.sh -s $series -e $experiment -i $iterations -l $learner

  ./search_logs.sh $series $experiment $learner

done





