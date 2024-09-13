n=5
if [ $# -eq 1 ]; then
    n=$1
fi
echo -n "$n," >> "mmult_runtimes.csv"
echo -n "$n," >> "mmult_performances.csv"
cp matrixSource.c matrix.c
sed -i s/#1/i/g matrix.c
sed -i s/#2/j/g matrix.c
sed -i s/#3/k/g matrix.c
gcc -o matrix1 -DN=$n -DPRINT matrix.c
./matrix1 > first_mat.txt
runtime=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' "first_mat.txt")
performance=$(echo "scale=2; ($n*$n*$n) / $runtime" | bc)
echo ijk: Runtime=$runtime Performance=$performance
echo -n "$runtime,">>"mmult_runtimes.csv"
echo -n "$performance,">>"mmult_performances.csv"
perms=("ikj" "jik" "jki" "kij" "kji")
for perm in ${perms[@]}; do
    cp matrixSource.c matrix.c
    sed -i s/#1/${perm:0:1}/g matrix.c
    sed -i s/#2/${perm:1:1}/g matrix.c
    sed -i s/#3/${perm:2:1}/g matrix.c
    gcc -o matrix2 -DN=$n -DPRINT matrix.c
    ./matrix2 > second_mat.txt
    diff_otpt=$(diff <(head -n -3 "first_mat.txt") <(head -n -3 "second_mat.txt"))
    if [ -n "$diff_otpt" ]; then
        echo "Matrices $first_mat and $mat are different."
        echo $diff_otpt
        exit 1
    fi
    runtime=$(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' second_mat.txt)
    performance=$(echo "scale=2; ($n*$n*$n) / $runtime" | bc)
    echo "$perm: Runtime=$runtime Performance=$performance"
    echo -n "$runtime,">>"mmult_runtimes.csv"
    echo -n "$performance,">>"mmult_performances.csv"
done
echo "" >>"mmult_runtimes.csv"
echo "" >>"mmult_performances.csv"
echo "No difference"