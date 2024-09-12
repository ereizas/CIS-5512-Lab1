results=("matrixijk.txt" "matrixikj.txt" "matrixjik.txt" "matrixjki.txt" "matrixkij.txt" "matrixkji.txt")
first_mat="${results[0]}"
diff_otpt=0
for mat in "${results[@]:1}"; do
    diff_otpt=$(diff <(head -n -3 "$first_mat") <(head -n -3 "$mat"))
    if [ -n "$diff_otpt" ]; then
        echo "Matrices $first_mat and $mat are different."
        echo $diff_otpt
    fi
done
if [ -z "$diff_otpt" ]; then
    echo "No difference"
fi
n=5
if [ $# -eq 1 ]; then
    n=$1
fi
echo "Matrix multiplication N=$n:"
for i in ${!results[@]}; do
    runtime=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' ${results[$i]})
    performance=$(echo "scale=2; ($n*$n*$n) / $runtime" | bc)
    echo ${results[$i]}: Runtime=$runtime Performance=$performance
done
