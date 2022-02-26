#define NN 2
#define LDA 10
#define LDB 10
#include <stdio.h>
#include "fc_mangle.h"

void GESS( int *, float *, int *, float *, int * , int *, float * );

int main() {
float A[NN*LDA],B[NN];
//Col order
#define A(I,J) A[ (I-1)+(J-1)*LDA]
#define B(I) B[ (I-1)]
//
int N,IA,IB,NB;
float cond;
int i;

A(1,1)= 13;
A(1,2)=14;
A(2,1)= -1;
A(2,2)= 3;


B(1)=27;
B(2)= 2;


N =2;
IA = LDA;
IB = LDB;
NB = 1;
GESS( (int *)&N, (float *)&A, (int *)&IA, (float *) &B, (int *)&IB, (int *)&NB, (float *) &cond);

printf("cond=%f\n",cond);
for (i=1;i<=N;i++) printf("%d %f\n",i,B(i));


}



