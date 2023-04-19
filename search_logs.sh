series=$1
experiment=$2
learner=$3
search="$4"

for f in `ls results/$series/$experiment-$learner/ | grep log`; do 

  less results/$series/$experiment-$learner/$f | grep "$search"; 

done
