results=("matrixijk.txt" "matrixikj.txt" "matrixjik.txt" "matrixjki.txt" "matrixkij.txt" "matrixkji.txt")
runtimes=()
./gen_mm_perms.sh 1000
./compare_mats.sh
for i in ${!results[@]}; do
    runtimes[$i]=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' ${results[$i]})
done
./gen_mm_perms.sh 2000
./compare_mats.sh
for i in ${!results[@]}; do
    runtimes[$i]=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' ${results[$i]})
done
./gen_mm_perms.sh 5000
./compare_mats.sh
for i in ${!results[@]}; do
    runtimes[$i]=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' ${results[$i]})
done
