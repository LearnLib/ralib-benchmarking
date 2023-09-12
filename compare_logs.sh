series=$1
experiment=$2

learners=("slstar" "sllambda" "sldt")
# phases=("Testing" "Optimization" "Analysis" "Processing" "Total excl testing" "Total:")
# headers=("Testing:          " "Optimization:     " "Analysis:         " "Processing:       " "Total excl tests: " "Total:            ")
stats=("Resets" "Inputs")
phase="Total excl testing"

std_dev() {
    local B=("$@")
    if [ -z "$B" ]; then
        echo 0
    else
        awk -v var="${B[*]}" 'BEGIN {n=split(var,a," ");
            x=0;
            y=0;
            for (v in a) {x+=a[v]; y+=a[v]^2};
            print sqrt(y/length(a) - (x/length(a))^2);}'
    fi
}

print_stat() {
    files="$3"
    sum=0
    n=0
    vals=()
    for f in ${files[@]}; do
        cat $f | grep -q "Execution terminated abnormally"
        if [ $? -eq 1 ]; then
            val=$(cat $f | grep "$1" | sed "s/.*$2: //g" | cut -d ' ' -f 1 | sed "s/[,\}]//g") 
            sum=$((sum+val))
            vals[${#vals[@]}]=$val
            n=$((n+1))
        fi
    done
    if [ $n -gt 0 ]; then
        avg=$((sum/n))
        std=$(std_dev "${vals[@]}" | sed "s/,/\./")
        printf "%5d, %8s" $avg $std
    else
        printf "--"
    fi
}

print_count() {
    files="$3"
    n=0
    for f in ${files[@]}; do
        line=`cat $f | grep "Last EQ Test found a counterexample: false"`
        if [ "$line" == "Last EQ Test found a counterexample: false" ]; then
            n=$((n+1))
        fi
    done
    printf "%1d/%1d" $n ${#files[@]}
}

print_header() {
    printf "Series, "
    printf "Experiment, "
    for stat in ${stats[@]}; do
        for learner in ${learners[@]}; do
          printf "$learner ($stat),, "
      done
    done  
    for learner in ${learners[@]}; do
        printf "$learner (CE),, "
    done
    for learner in ${learners[@]}; do
        printf "$learner (#), "
    done
    printf "\n"
}

if [ "$1" == "-h" ]; then
  print_header
  exit
fi

printf "%15s, %15s, " $series $experiment
for stat in ${stats[@]}; do
    for learner in ${learners[@]}; do
    if [ -d "results/$series/$experiment-$learner" ]; then
        files=($(ls results/$series/$experiment-$learner | grep 'log' | sed "s/\(.*\)/results\/$series\/$experiment-$learner\/\1/"))
        print_stat "$phase" $stat $files
    else
        printf "--"
    fi 
    printf ", "   
    done
done  
for learner in ${learners[@]}; do
    if [ -d "results/$series/$experiment-$learner" ]; then
        files=($(ls results/$series/$experiment-$learner | grep 'log' | sed "s/\(.*\)/results\/$series\/$experiment-$learner\/\1/"))
        print_stat "Counterexamples" "Counterexamples" $files
    else
        printf "--"
    fi 
    printf ", "   
done
for learner in ${learners[@]}; do
    if [ -d "results/$series/$experiment-$learner" ]; then
        files=($(ls results/$series/$experiment-$learner | grep 'log' | sed "s/\(.*\)/results\/$series\/$experiment-$learner\/\1/"))
        print_count "Counterexamples" "Counterexamples" $files
    else
        printf "--"
    fi
    printf ", "   
done
printf "\n"


#%5d %d.4

#for learner in ${!learners[@]}; do
#    if [ -d "results/$series/$experiment-$learner" ]; then
#        files=($(ls results/$series/$experiment-$learner | grep 'log' | sed "s/\(.*\)/results\/$series\/$experiment-$learner\/\1/"))
#    #printf "Counterexamples:  "
#    print_stat "Counterexamples" "Counterexamples" $files
#    #printf "CE max length:    "
#    print_stat "CE max length" "CE max length" $files
#    #printf "CE avg length:    "
#    print_stat "CE avg length" "CE avg length" $files
#    for stat in ${stats[@]}; do
#        echo $stat | tr '[:lower:]' '[:upper:]'
#        for index in ${!phases[@]}; do
#            printf "%s" "${headers[$index]}"
#            print_stat "${phases[$index]}" $stat $files
#        done
#    done
#    printf "Successful: %d/%d\n" $n ${#files[@]}
#fi



