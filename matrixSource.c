//From https://gist.github.com/rehrumesh/5686ffd54bdaaf54751c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include <assert.h>

#define RANDLIMIT	5	/* Magnitude limit of generated randno.*/
#define NUMLIMIT 70.0

float a[N][N];
float b[N][N];
float c[N][N];

int main(int argc, char *argv[])
{
	struct timeval start, stop;
	int #1, #2, #3;


	/* generate mxs  */
	for (#1 = 0; #1 < N; #1++)
	for (#2 = 0; #2 < N; #2++) {
		a[#1][#2] = 1 + (int)(NUMLIMIT*rand() / (RAND_MAX + 1.0));
		b[#1][#2] = (double)(rand() % RANDLIMIT);

	}

#ifdef PRINT
	/* print matrices */
	printf("Matrix A:\n");
	for (#1 = 0; #1 < N; #1++){
		for (#2 = 0; #2 < N; #2++)
			printf("%.3f\t", a[#1][#2]);
		printf("\n");
	}

	printf("Matrix B:\n");
	for (#1 = 0; #1 < N; #1++){
		for (#2 = 0; #2 < N; #2++)
			printf("%.3f\t", b[#1][#2]);
		printf("\n");
	}

	printf("Matrix C:\n");
	for (#1 = 0; #1 < N; #1++){
		for (#2 = 0; #2 < N; #2++)
			printf("%.3f\t", c[#1][#2]);
		printf("\n");
	}
#endif

	gettimeofday(&start, 0);

	for (#1 = 0; #1 < N; #1++) {
		for (#2 = 0; #2 < N; #2++) {
			c[#1][#2] = 0.0;
			for (#3 = 0; #3 < N; #3++)
				c[#1][#2] = c[#1][#2] + a[#1][#3] * b[#3][#2];
		} /* end #2 loop */
	}

	gettimeofday(&stop, 0);

#ifdef PRINT
	/* print results*/
	printf("Answer c:\n");
	for (#1 = 0; #1 < N; #1++){
		for (#2 = 0; #2 < N; #2++)
			printf("%.3f\t", c[#1][#2]);
		printf("\n");
	}
#endif

	fprintf(stdout, "Time = %.6f\n\n",
		(stop.tv_sec + stop.tv_usec*1e-6) - (start.tv_sec + start.tv_usec*1e-6));
	return(0);
}