#!/bin/bash

# ###########################################################
#
# PARSE INPUT

usage="
Usage: $(basename "$0") [-h] -s series -e experiment -i iterations

where:
    -s  series folder in experiments
    -e  experiment (name of xml file w/o .xml)
    -i  iterations
    "

series=""
experiment=""
iterations=""
while getopts 'hs:e:i:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) series=$OPTARG
       ;;
    e) experiment=$OPTARG
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

if [ -z "$series" -o -z "$experiment" -o -z "$usage" ]; then
  echo "$usage" >&2
  exit 1
fi

# BUILD CONFIG

config=experiments/$series/config
model=experiments/$series/$experiment.xml
results=results/$series/$experiment

# PREPARE FILES AND DIRS

rm -Rf $results
mkdir -p $results

# EXECUTE

for c in `seq 1 $iterations`
do

  rm -Rf model.xml
  rm -Rf learn.log
  rm -Rf hs_err_pid*

  echo "Running: $c"

  for r in `seq 1 3`
  do

    java -Xmx7G -ea -jar ../lib/ralib-0.1-SNAPSHOT-jar-with-dependencies.jar iosimulator -f $config target=$model > learn.log 2>&1
    if [ "0" == `ls hs_err_pid* 2> /dev/null | wc -l` ]; then 
      break;
    fi
    rm -Rf hs_err_pid*
    echo "  attempt $r failed"
  done

  if [ "0" == `less learn.log | grep "= STOP =" | wc -l` ]; then 
    seed=`less learn.log | grep "RANDOM SEED"`
    echo "Problem with iteration $c, $seed."
  fi

  mv learn.log $results/learn-$c.log
  mv model.xml $results/model-$c.xml
  rm -Rf hs_err_pid*

done





