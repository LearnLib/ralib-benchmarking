#!/usr/bin/env bash

learners=("slstar" "sllambda" "sldt")

for learner in ${learners[@]}; do
    ./run_series.sh -s ct-big-datastructures -i 20 -l $learner
done
