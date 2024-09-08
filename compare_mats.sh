results=("matrixijk.txt" "matrixikj.txt" "matrixjik.txt" "matrixjki.txt" "matrixkij.txt" "matrixkji.txt")
first_mat="${results[0]}"
for mat in "${results[@]:1}"; do
    diff_otpt=$(diff <(head -n -3 "$first_mat") <(head -n -3 "$mat"))
    if [ -n "$diff_otpt" ]; then
        echo "Matrices $first_mat and $mat are different."
        echo $diff_otpt
    fi
done