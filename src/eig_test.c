#include <stdio.h>
#include "Matrix_Utils.h"
#define A_n 3
#define A_m 3
#define WR_n 3
#define WR_m 1
#define WI_n 3
#define WI_m 1
#define Z_n 3
#define Z_m 6

void eigen_(int *, int *, float *, float *, float *, float *);

int main() {
    #define A(I,J) A[(I-1)+(J-1)*A_n]
    #define WR(I,J) WR[(I-1)+(J-1)*WR_n]
    #define WI(I,J) WI[(I-1)+(J-1)*WI_n]
    #define Z(I,J) Z[(I-1)+(J-1)*Z_n]
    float A[A_n*A_m] = {0}, WR[WR_n*WR_m] = {0}, WI[WI_n*WI_m] = {0}, Z[Z_n*Z_m] = {0};
    int NM = 3, N = 3; 

    A(1,1) = 0; A(1,2) = 1; A(1,3) = 2;
    A(2,1) = 3; A(2,2) = 4; A(2,3) = 5;
    A(3,1) = 6; A(3,2) = 7; A(3,3) = 8;

    eigen_((int *)&NM, (int *)&N, (float *)&A, (float *)&WR, (float *)&WI, (float *)&Z);
    Matrix_Print(WR, WR_n, WR_m);
    Matrix_Print(WI, WI_n, WI_m);
    Matrix_Print(Z, Z_n, Z_m);

    
    return 0;
}
