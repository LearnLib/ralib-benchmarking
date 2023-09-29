#!/bin/sh

actions=("2" "4" "6" "8" "10")
numbers=("2" "11" "23" "39" "41" "54" "67" "78" "89" "90")

for a in ${actions[@]}; do
    for n in ${numbers[@]}; do
        ln -s ../../benchmarks/models/generated/Q-35/A-${a}/R-0.50/G-3/Q-35_A-${a}_R-0.50_G-3_${n}.xml .
    done
done

