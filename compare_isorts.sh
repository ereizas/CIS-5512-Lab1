gcc -o iSort iSort.c -DMAX=5000
./iSort > iSort_otpt.txt

gcc -o iSort2 iSort2.c -DMAX=5000
./iSort2 > iSort2_otpt.txt

if [ -z $(diff <(head -n -3 "iSort_otpt.txt") <(head -n -3 "iSort2_otpt.txt")) ]; then
    echo "The arrays are the same."
else
    echo "The arrays are different."
fi

echo iSort Elapsed Time: $(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' 'iSort_otpt.txt')
echo iSort2 Elapsed Time: $(sed -n 's/Time = \([0-9]*\.[0-9]*\)/\1/p' 'iSort2_otpt.txt')