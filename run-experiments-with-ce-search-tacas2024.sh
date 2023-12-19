#!/usr/bin/env bash

learners=("slstar" "sllambda" "sldt")

for learner in "${learners[@]}"; do
    ./run_series.sh -s ct-with-rwalk -i 20 -l "$learner"
    ./run_series.sh -s ct-datastructures -i 20 -l "$learner"
done
