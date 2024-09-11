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

void insertionSort(int *arr,int size) {
  int valueToInsert;
  int holePosition;
  int i;
 
  // loop through all numbers 
  for(i = 1; i < size; i++) { 
     // select a value to be inserted. 
     valueToInsert = arr[i];

     // select the hole position where number is to be inserted 
     holePosition = i;

     // check if previous no. is larger than value to be inserted 
     while (holePosition > 0 && arr[holePosition-1] > valueToInsert) {
        arr[holePosition] = arr[holePosition-1];
        holePosition--;
        //printf(" item moved : %d\n" , arr[holePosition]);
     }

     if(holePosition != i) {
        //printf(" item inserted : %d, at position : %d\n" , valueToInsert,holePosition);
        // insert the number at current hole
        arr[holePosition] = valueToInsert;
     }

     //printf("Iteration %d#:",i);
     //display();

  } 
}

int mergeSort(int *arr1, int *arr2){
   int i = 0, l = 0, r = 0;
   while(l<MAX/2 && r<MAX/2+MAX%2){
      if(arr1[l]<arr2[r]){
         intArray[i]=arr1[l];
         l++;
      }
      else{
         intArray[i]=arr2[r];
         r++;
      }
      i++;
   }
   while(l<MAX/2){
      intArray[i]=arr1[l];
      l++;
      i++;
   }
   while(r<MAX/2+MAX%2){
      intArray[i]=arr2[r];
      r++;
      i++;
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
   int arr1[MAX/2], arr2[MAX/2+MAX%2];
   for(int i = 0;i<MAX/2;i++){
      arr1[i]=intArray[i];
   }
   for(int i = MAX/2;i<MAX+MAX%2;i++){
      arr2[i-MAX/2]=intArray[i];
   }
   insertionSort(arr1,MAX/2);
   insertionSort(arr2,MAX/2+MAX%2);
   mergeSort(arr1,arr2);
   gettimeofday(&stop, 0);
   printf("Time = %.6f\n\n",(stop.tv_sec + stop.tv_usec*1e-6) - (start.tv_sec + start.tv_usec*1e-6));
   printf("Output Array: ");
   display();
   printline(50);
}