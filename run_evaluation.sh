
# basic correctness

./run_series.sh -s baseline-eq -i 2 -l slstar
./run_series.sh -s baseline-eq -i 2 -l sllambda
./run_series.sh -s baseline-eq -i 2 -l sldt

./run_series.sh -s baseline-ineq -i 2 -l slstar
./run_series.sh -s baseline-ineq -i 2 -l sllambda
./run_series.sh -s baseline-ineq -i 2 -l sldt

# correctness with random ces

./run_series.sh -s rwalk-eq -i 5 -l slstar
./run_series.sh -s rwalk-eq -i 5 -l sllambda
./run_series.sh -s rwalk-eq -i 5 -l sldt

./run_series.sh -s rwalk-ineq -i 5 -l slstar
./run_series.sh -s rwalk-ineq -i 5 -l sllambda
./run_series.sh -s rwalk-ineq -i 5 -l sldt
