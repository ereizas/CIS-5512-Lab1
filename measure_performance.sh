n=5
if [ $# -eq 1 ]; then
    n=$1
fi
results=("matrixijk.txt" "matrixikj.txt" "matrixjik.txt" "matrixjki.txt" "matrixkij.txt" "matrixkji.txt")
echo "Matrix multiplication N=$n:"
./gen_mm_perms.sh $n
./compare_mats.sh
for i in ${!results[@]}; do
    runtime=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' ${results[$i]})
    performance=$(echo "scale=2; ($n*$n*$n) / $runtime" | bc)
    echo ${results[$i]}: Runtime=$runtime Performance=$performance
done