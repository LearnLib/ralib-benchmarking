

learners=("slstar" "sllambda" "sldt")
#for learner in ${learners[@]}; do
#  ./run_series.sh -s scaling-eq -i 1 -l $learner
#  ./run_series.sh -s scaling-rwalk-eq -i 5 -l $learner
#  ./run_series.sh -s baseline-eq -i 1 -l $learner
#  ./run_series.sh -s rwalk-eq -i 5 -l $learner
#  ./run_series.sh -s baseline-ineq -i 1 -l $learner
#  ./run_series.sh -s datastructures -i 5 -l $learner
#done

./compare_logs.sh -h

./compare_logs.sh scaling-eq model.steps1
./compare_logs.sh scaling-eq model.steps2
./compare_logs.sh scaling-eq model.steps4
./compare_logs.sh scaling-eq model.steps8

./compare_logs.sh scaling-eq model.remfirst1
./compare_logs.sh scaling-eq model.remfirst2
./compare_logs.sh scaling-eq model.remfirst4
./compare_logs.sh scaling-eq model.remfirst8

./compare_logs.sh scaling-eq model.remember1
./compare_logs.sh scaling-eq model.remember2
./compare_logs.sh scaling-eq model.remember4
./compare_logs.sh scaling-eq model.remember8

./compare_logs.sh scaling-eq model.remlast1
./compare_logs.sh scaling-eq model.remlast2
./compare_logs.sh scaling-eq model.remlast4
./compare_logs.sh scaling-eq model.remlast8

./compare_logs.sh baseline-eq abp_output
./compare_logs.sh baseline-eq abp_receiver3
./compare_logs.sh baseline-eq channel_frame
./compare_logs.sh baseline-eq login
./compare_logs.sh baseline-eq palindrome

./compare_logs.sh rwalk-eq abp_output
./compare_logs.sh rwalk-eq abp_receiver3
./compare_logs.sh rwalk-eq channel_frame
./compare_logs.sh rwalk-eq login
./compare_logs.sh rwalk-eq palindrome

./compare_logs.sh baseline-ineq pq3

./compare_logs.sh datastructures fifo1
./compare_logs.sh datastructures fifo3
./compare_logs.sh datastructures fifo5

./compare_logs.sh datastructures lifo1
./compare_logs.sh datastructures lifo3
./compare_logs.sh datastructures lifo5

./compare_logs.sh datastructures fset1
./compare_logs.sh datastructures fset3
./compare_logs.sh datastructures fset5

