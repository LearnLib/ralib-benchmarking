#!/bin/sh

locations=("20" "30" "40" "50" "60")
actions=("2" "4" "6" "8" "10")
data=("10" "20" "30" "40" "50")
numbers=("2" "11" "23" "39" "41" "54" "67" "78" "89" "90")

./compare-learners.sh -h


for l in ${locations[@]}; do
   for n in ${numbers[@]}; do
       ./compare-learners.sh gen-locations Q-${l}_A-5_R-0.50_G-3_${n}
   done
   echo ""
done

for a in ${actions[@]}; do
   for n in ${numbers[@]}; do
      ./compare-learners.sh gen-actions Q-35_A-${a}_R-0.50_G-3_${n}
   done
   echo ""
done

for d in ${data[@]}; do
    for n in ${numbers[@]}; do
       ./compare-learners.sh gen-registers Q-35_A-5_R-0.${d}_G-3_${n}
    done
    echo ""
done


for d in ${data[@]}; do
    for n in ${numbers[@]}; do
       ./compare-learners.sh gen-registers-noopt Q-35_A-5_R-0.${d}_G-3_${n}
    done
   echo ""
done

