series=$1
experiment=$2
search="$3"

for f in `ls results/$series/$experiment/ | grep log`; do 

  less results/$series/$experiment/$f | grep "$search"; 

done
