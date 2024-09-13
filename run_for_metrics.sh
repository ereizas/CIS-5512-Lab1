
#/bin/bash
start=100
stop=3000
step=100
if [ $# -eq 3 ]; then
        start=($1)
        stop=($2)
        step=($3)
fi
while(($start<=$stop))
do
  echo "N=$start"
  ./gen_and_cmpr_mats.sh $start
  start=$(( start+step ))
done
