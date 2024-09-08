n=5
if [ $#==1 ]; then
    n=$1
fi
cp matrixSource.c matrix.c
sed -i s/#1/i/g matrix.c
sed -i s/#2/j/g matrix.c
sed -i s/#3/k/g matrix.c
gcc -o matrixijk -DN=$n -DPRINT matrix.c
./matrixijk > matrixijk.txt

cp matrixSource.c matrix.c
sed -i s/#1/i/g matrix.c
sed -i s/#2/k/g matrix.c
sed -i s/#3/j/g matrix.c
gcc -o matrixikj -DN=$n -DPRINT matrix.c
./matrixikj > matrixikj.txt

cp matrixSource.c matrix.c
sed -i s/#1/j/g matrix.c
sed -i s/#2/i/g matrix.c
sed -i s/#3/k/g matrix.c
gcc -o matrixjik -DN=$n -DPRINT matrix.c
./matrixjik > matrixjik.txt

cp matrixSource.c matrix.c
sed -i s/#1/k/g matrix.c
sed -i s/#2/j/g matrix.c
sed -i s/#3/i/g matrix.c
gcc -o matrixkji -DN=$n -DPRINT matrix.c
./matrixkji > matrixkji.txt

cp matrixSource.c matrix.c
sed -i s/#1/k/g matrix.c
sed -i s/#2/i/g matrix.c
sed -i s/#3/j/g matrix.c
gcc -o matrixkij -DN=$n -DPRINT matrix.c
./matrixkij > matrixkij.txt

cp matrixSource.c matrix.c
sed -i s/#1/j/g matrix.c
sed -i s/#2/k/g matrix.c
sed -i s/#3/i/g matrix.c
gcc -o matrixjki -DN=$n -DPRINT matrix.c
./matrixjki > matrixjki.txt