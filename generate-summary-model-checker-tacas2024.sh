#!/bin/sh

locations=("20" "30" "40" "50" "60")
actions=("4" "14" "24" "34" "44")
data=("0.20" "0.40" "0.60" "0.80" "1.00")
numbers=("2" "11" "23" "39" "41" "54" "67" "78" "89" "90")

./compare-learners.sh -h


for l in ${locations[@]}; do
   for n in ${numbers[@]}; do
       ./compare-learners.sh gen-locations Q-${l}_A-25_R-0.50_G-3_${n}
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
       ./compare-learners.sh gen-registers Q-35_A-25_R-${d}_G-3_${n}
    done
    echo ""
done


for d in ${data[@]}; do
    for n in ${numbers[@]}; do
       ./compare-learners.sh gen-registers-noopt Q-35_A-25_R-${d}_G-3_${n}
    done
   echo ""
done


./compare-learners.sh dtls-baseline-eq client-1   
./compare-learners.sh dtls-baseline-eq client-14  
./compare-learners.sh dtls-baseline-eq client-19  
./compare-learners.sh dtls-baseline-eq client-23  
./compare-learners.sh dtls-baseline-eq client-28  
./compare-learners.sh dtls-baseline-eq client-32  
./compare-learners.sh dtls-baseline-eq client-6   
./compare-learners.sh dtls-baseline-eq server-1   
./compare-learners.sh dtls-baseline-eq server-14  
./compare-learners.sh dtls-baseline-eq server-19  
./compare-learners.sh dtls-baseline-eq server-23  
./compare-learners.sh dtls-baseline-eq server-6
./compare-learners.sh dtls-baseline-eq client-10  
./compare-learners.sh dtls-baseline-eq client-15  
./compare-learners.sh dtls-baseline-eq client-2   
./compare-learners.sh dtls-baseline-eq client-24  
./compare-learners.sh dtls-baseline-eq client-29  
./compare-learners.sh dtls-baseline-eq client-33  
./compare-learners.sh dtls-baseline-eq client-7   
./compare-learners.sh dtls-baseline-eq server-10  
./compare-learners.sh dtls-baseline-eq server-15  
./compare-learners.sh dtls-baseline-eq server-2   
./compare-learners.sh dtls-baseline-eq server-24  
./compare-learners.sh dtls-baseline-eq server-7
./compare-learners.sh dtls-baseline-eq client-11  
./compare-learners.sh dtls-baseline-eq client-16  
./compare-learners.sh dtls-baseline-eq client-20  
./compare-learners.sh dtls-baseline-eq client-25  
./compare-learners.sh dtls-baseline-eq client-3   
./compare-learners.sh dtls-baseline-eq client-34  
./compare-learners.sh dtls-baseline-eq client-8   
./compare-learners.sh dtls-baseline-eq server-11  
./compare-learners.sh dtls-baseline-eq server-16  
./compare-learners.sh dtls-baseline-eq server-20  
./compare-learners.sh dtls-baseline-eq server-3   
./compare-learners.sh dtls-baseline-eq server-8
./compare-learners.sh dtls-baseline-eq client-12  
./compare-learners.sh dtls-baseline-eq client-17  
./compare-learners.sh dtls-baseline-eq client-21  
./compare-learners.sh dtls-baseline-eq client-26  
./compare-learners.sh dtls-baseline-eq client-30  
./compare-learners.sh dtls-baseline-eq client-4   
./compare-learners.sh dtls-baseline-eq client-9   
./compare-learners.sh dtls-baseline-eq server-12  
./compare-learners.sh dtls-baseline-eq server-17  
./compare-learners.sh dtls-baseline-eq server-21  
./compare-learners.sh dtls-baseline-eq server-4   
./compare-learners.sh dtls-baseline-eq server-9
./compare-learners.sh dtls-baseline-eq client-13  
./compare-learners.sh dtls-baseline-eq client-18  
./compare-learners.sh dtls-baseline-eq client-22  
./compare-learners.sh dtls-baseline-eq client-27  
./compare-learners.sh dtls-baseline-eq client-31  
./compare-learners.sh dtls-baseline-eq client-5   
./compare-learners.sh dtls-baseline-eq server-13  
./compare-learners.sh dtls-baseline-eq server-18  
./compare-learners.sh dtls-baseline-eq server-22  
./compare-learners.sh dtls-baseline-eq server-5

./compare-learners.sh dtls-baseline-eq-noopt client-1   
./compare-learners.sh dtls-baseline-eq-noopt client-14  
./compare-learners.sh dtls-baseline-eq-noopt client-19  
./compare-learners.sh dtls-baseline-eq-noopt client-23  
./compare-learners.sh dtls-baseline-eq-noopt client-28  
./compare-learners.sh dtls-baseline-eq-noopt client-32  
./compare-learners.sh dtls-baseline-eq-noopt client-6   
./compare-learners.sh dtls-baseline-eq-noopt server-1   
./compare-learners.sh dtls-baseline-eq-noopt server-14  
./compare-learners.sh dtls-baseline-eq-noopt server-19  
./compare-learners.sh dtls-baseline-eq-noopt server-23  
./compare-learners.sh dtls-baseline-eq-noopt server-6
./compare-learners.sh dtls-baseline-eq-noopt client-10  
./compare-learners.sh dtls-baseline-eq-noopt client-15  
./compare-learners.sh dtls-baseline-eq-noopt client-2   
./compare-learners.sh dtls-baseline-eq-noopt client-24  
./compare-learners.sh dtls-baseline-eq-noopt client-29  
./compare-learners.sh dtls-baseline-eq-noopt client-33  
./compare-learners.sh dtls-baseline-eq-noopt client-7   
./compare-learners.sh dtls-baseline-eq-noopt server-10  
./compare-learners.sh dtls-baseline-eq-noopt server-15  
./compare-learners.sh dtls-baseline-eq-noopt server-2   
./compare-learners.sh dtls-baseline-eq-noopt server-24  
./compare-learners.sh dtls-baseline-eq-noopt server-7
./compare-learners.sh dtls-baseline-eq-noopt client-11  
./compare-learners.sh dtls-baseline-eq-noopt client-16  
./compare-learners.sh dtls-baseline-eq-noopt client-20  
./compare-learners.sh dtls-baseline-eq-noopt client-25  
./compare-learners.sh dtls-baseline-eq-noopt client-3   
./compare-learners.sh dtls-baseline-eq-noopt client-34  
./compare-learners.sh dtls-baseline-eq-noopt client-8   
./compare-learners.sh dtls-baseline-eq-noopt server-11  
./compare-learners.sh dtls-baseline-eq-noopt server-16  
./compare-learners.sh dtls-baseline-eq-noopt server-20  
./compare-learners.sh dtls-baseline-eq-noopt server-3   
./compare-learners.sh dtls-baseline-eq-noopt server-8
./compare-learners.sh dtls-baseline-eq-noopt client-12  
./compare-learners.sh dtls-baseline-eq-noopt client-17  
./compare-learners.sh dtls-baseline-eq-noopt client-21  
./compare-learners.sh dtls-baseline-eq-noopt client-26  
./compare-learners.sh dtls-baseline-eq-noopt client-30  
./compare-learners.sh dtls-baseline-eq-noopt client-4   
./compare-learners.sh dtls-baseline-eq-noopt client-9   
./compare-learners.sh dtls-baseline-eq-noopt server-12  
./compare-learners.sh dtls-baseline-eq-noopt server-17  
./compare-learners.sh dtls-baseline-eq-noopt server-21  
./compare-learners.sh dtls-baseline-eq-noopt server-4   
./compare-learners.sh dtls-baseline-eq-noopt server-9
./compare-learners.sh dtls-baseline-eq-noopt client-13  
./compare-learners.sh dtls-baseline-eq-noopt client-18  
./compare-learners.sh dtls-baseline-eq-noopt client-22  
./compare-learners.sh dtls-baseline-eq-noopt client-27  
./compare-learners.sh dtls-baseline-eq-noopt client-31  
./compare-learners.sh dtls-baseline-eq-noopt client-5   
./compare-learners.sh dtls-baseline-eq-noopt server-13  
./compare-learners.sh dtls-baseline-eq-noopt server-18  
./compare-learners.sh dtls-baseline-eq-noopt server-22  
./compare-learners.sh dtls-baseline-eq-noopt server-5
