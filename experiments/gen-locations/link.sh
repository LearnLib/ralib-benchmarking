#!/bin/sh

locations=("20" "30" "40" "50" "60")
numbers=("2" "11" "23" "39" "41" "54" "67" "78" "89" "90")

for l in ${locations[@]}; do
    for n in ${numbers[@]}; do
        ln -s ../../benchmarks/models/generated/Q-${l}/A-5/R-0.50/G-3/Q-${l}_A-5_R-0.50_G-3_${n}.xml .
    done
done

