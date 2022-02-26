#pragma once
void Matrix_Multiply(float*, float*, float*, int, int, int);
void Matrix_Print(float*, int, int); 
void Matrix_Clear(float*, int, int); 
void Matrix_Transpose(float*, float*, int, int);

void Matrix_Multiply_double(double*, double*, double*, int, int, int);
void Matrix_Print_double(double*, int, int); 
void Matrix_Transpose_double(double*, double*, int, int);

void Matrix_Print(float* __a, int __a_n, int __a_m) {
    #define __a(I,J) __a[(I-1)+(J-1)*__a_n]
    printf("[");
    for(int i=1; i<=__a_n; i++) {
        for(int j=1; j<=__a_m; j++) {
           printf("[%f],",__a(i,j)); 
        }
        printf("\n");
    }
    printf("]\n");
    
}

void Matrix_Clear(float* ____a, int ____a_n, int ____a_m) {
    #define ____a(I,J) ____a[(I-1)+(J-1)*____a_n]
    for(int i=1; i<=____a_n; i++) {
        for(int j=1; j<=____a_m; j++) {
           ____a(i,j) = 0.0;
        }
    }
    
}

void Matrix_Transpose(float* ___a, float* ___aT, int ___a_n, int ___a_m) {
    #define ___a(I,J) ___a[(I-1)+(J-1)*___a_n]
    #define ___aT(I,J) ___aT[(I-1)+(J-1)*___a_m]
    for(int i=1; i<=___a_n; i++) {
        for(int j=1; j<=___a_m; j++) {
            ___aT(j,i) = ___a(i,j);
        }
    }

}

void Matrix_Multiply(float* _a, float* _b, float*  _c, int _a_n, int _a_m_b_n, int _b_m) {
    #define _a(I,J) _a[(I-1)+(J-1)*_a_n]
    #define _b(I,J) _b[(I-1)+(J-1)*_a_m_b_n]
    #define _c(I,J) _c[(I-1)+(J-1)*_a_n]
    for(int i=1; i<=_a_n; i++) {
        for(int j=1; j<=_a_m_b_n; j++) {
            for(int k=1; k<=_b_m; k++) {
                _c(i,k) = _c(i,k) + _a(i,j)*_b(j,k);            
            }
        }
    }
}

void Matrix_Print_double(double* __a, int __a_n, int __a_m) {
    #define __a(I,J) __a[(I-1)+(J-1)*__a_n]
    printf("[");
    for(int i=1; i<=__a_n; i++) {
        for(int j=1; j<=__a_m; j++) {
           printf("[%f],",__a(i,j)); 
        }
        printf("\n");
    }
    printf("]\n");
    
}

void Matrix_Transpose_double(double* ___a, double* ___aT, int ___a_n, int ___a_m) {
    #define ___a(I,J) ___a[(I-1)+(J-1)*___a_n]
    #define ___aT(I,J) ___aT[(I-1)+(J-1)*___a_m]
    for(int i=1; i<=___a_n; i++) {
        for(int j=1; j<=___a_m; j++) {
            ___aT(j,i) = ___a(i,j);
        }
    }

}

void Matrix_Multiply_double(double* _a, double* _b, double*  _c, int _a_n, int _a_m_b_n, int _b_m) {
    #define _a(I,J) _a[(I-1)+(J-1)*_a_n]
    #define _b(I,J) _b[(I-1)+(J-1)*_a_m_b_n]
    #define _c(I,J) _c[(I-1)+(J-1)*_a_n]
    for(int i=1; i<=_a_n; i++) {
        for(int j=1; j<=_a_m_b_n; j++) {
            for(int k=1; k<=_b_m; k++) {
                _c(i,k) = _c(i,k) + _a(i,j)*_b(j,k);            
            }
        }
    }
}
