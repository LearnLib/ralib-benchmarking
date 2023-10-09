#!/bin/sh

learners=("slstar" "sllambda" "sldt")

for learner in ${learners[@]}; do
  ./run_series.sh -s gen-locations -i 1 -l $learner
  ./run_series.sh -s gen-actions -i 1 -l $learner
  ./run_series.sh -s gen-registers -i 1 -l $learner
  ./run_series.sh -s gen-registers-noopt -i 1 -l $learner
  ./run_series.sh -s dtls-baseline-eq -i 1 -l $learner
  ./run_series.sh -s dtls-baseline-eq-noopt -i 1 -l $learner
done
