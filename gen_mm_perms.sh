cp matrixSource.c matrix.c

sed -i s/#1/i/g matrix.c
sed -i s/#2/j/g matrix.c
sed -i s/#3/k/g matrix.c
gcc -o matrixijk -DN=5 -DPRINT matrix.c
./matrixijk

sed -i s/#1/i/g matrix.c
sed -i s/#2/k/g matrix.c
sed -i s/#3/j/g matrix.c
gcc -o matrixikj -DN=5 -DPRINT matrix.c
./matrixikj

sed -i s/#1/j/g matrix.c
sed -i s/#2/i/g matrix.c
sed -i s/#3/k/g matrix.c
gcc -o matrixjik -DN=5 -DPRINT matrix.c
./matrixjik

sed -i s/#1/k/g matrix.c
sed -i s/#2/j/g matrix.c
sed -i s/#3/i/g matrix.c
gcc -o matrixkji -DN=5 -DPRINT matrix.c
./matrixkji

sed -i s/#1/k/g matrix.c
sed -i s/#2/i/g matrix.c
sed -i s/#3/j/g matrix.c
gcc -o matrixkij -DN=5 -DPRINT matrix.c
./matrixkij

sed -i s/#1/j/g matrix.c
sed -i s/#2/k/g matrix.c
sed -i s/#3/i/g matrix.c
gcc -o matrixjki -DN=5 -DPRINT matrix.c
./matrixjki