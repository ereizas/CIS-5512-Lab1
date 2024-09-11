//From https://www.interviewbit.com/courses/programming/arrays/insertion-sort-algorithm/#examples
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <sys/time.h>

int intArray[MAX];

void printline(int count) {
  int i;

  for(i = 0;i < count-1;i++) {
     printf("=");
  }

  printf("=\n");
}

void display() {
  int i;
  printf("[");

  // navigate through all items 
  for(i = 0;i < MAX;i++) {
     printf("%d ",intArray[i]);
  }

  printf("]\n");
}

void insertionSort() {
  int valueToInsert;
  int holePosition;
  int i;
 
  // loop through all numbers 
  for(i = 1; i < MAX; i++) { 

     // select a value to be inserted. 
     valueToInsert = intArray[i];

     // select the hole position where number is to be inserted 
     holePosition = i;

     // check if previous no. is larger than value to be inserted 
     while (holePosition > 0 && intArray[holePosition-1] > valueToInsert) {
        intArray[holePosition] = intArray[holePosition-1];
        holePosition--;
        //printf(" item moved : %d\n" , intArray[holePosition]);
     }

     if(holePosition != i) {
        //printf(" item inserted : %d, at position : %d\n" , valueToInsert,holePosition);
        // insert the number at current hole
        intArray[holePosition] = valueToInsert;
     }

     //printf("Iteration %d#:",i);
     //display();

  } 
}

void main() {
    for(int i=0; i<MAX; i++){
        intArray[i]=rand()%MAX;
    }
  printf("Input Array: ");
  display();
  printline(50);
  struct timeval start, stop;   
  gettimeofday(&start, 0);
  insertionSort();
  gettimeofday(&stop, 0);
  printf("Time = %.6f\n\n",(stop.tv_sec + stop.tv_usec*1e-6) - (start.tv_sec + start.tv_usec*1e-6));
  printf("Output Array: ");
  display();
  printline(50);
}