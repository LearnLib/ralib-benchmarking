#!/bin/sh

data=("0.20" "0.40" "0.60" "0.80" "1.00")
numbers=("2" "11" "23" "39" "41" "54" "67" "78" "89" "90")

for d in ${data[@]}; do
    for n in ${numbers[@]}; do
        ln -s ../../benchmarks/models/generated/Q-35/A-25/R-${d}/G-3/Q-35_A-25_R-${d}_G-3_${n}.xml .
    done
done
