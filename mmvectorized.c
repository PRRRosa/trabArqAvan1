#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>
#include <sys/time.h>
#include <x86intrin.h>
//#define IMPRIME

void multiplica(int m, int n, float *matA, float *matB, float matC[m][n]){
 int i, j, k, som;
 __m128 va, vb, vresult;

 for (int i = 0; i < m; i++) {
         for (int j = 0; j < n; j++) {
             for (int k = 0; k < m; k += 4) {
                 // load
                 va = _mm_loadu_ps(matA+(i*m)+k); // matrix_a[i][k]
                 vb = _mm_loadu_ps(matB+(j*n)+k); // matrix_b[j][k]

                 // multiply
                 vresult = _mm_mul_ps(va, vb);

                 // add
                 vresult = _mm_hadd_ps(vresult, vresult);
                 vresult = _mm_hadd_ps(vresult, vresult);

                 // store
                 matC[i][j] += _mm_cvtss_f32(vresult);
             }
         }
     }

}

float *aloca(int m, int n, float *matriz){
 int i;
 matriz = malloc(m*n*sizeof(float));
 return matriz;
}



double GetTime(void)
{
   struct  timeval time;
   double  Time;

   gettimeofday(&time, (struct timezone *) NULL);
   Time = ((double)time.tv_sec*1000000.0 + (double)time.tv_usec);
   return(Time);
}


void imprime(int m, int n, int **matriz){
 int i, j;
 for(i=0; i<m; i++){
   for(j=0; j<n; j++){
     printf("%d ", matriz[i][j]);
   }
   printf("\n");
 }
}

void inicializa(int m, int n, float *matriz){
 int i, j;
 for (i=0;i<m;i++){
   for(j=0;j<n;j++){
     matriz[i+j]=i+j;
   }
 }
}


/*void desaloca(int m, int n, float *matriz){
 int i;
 for(i=0;i<m;i++){
   free(matriz[i]);
 }
 free(matriz);
}*/

int main (int argc, char *argv[]) {
 float *matA;
 float *matB;
 int m,n,i,j,k; // m(linhas) e n (colunas)
 double clockBegin;
 double timeElapsed;
 if(argc!=3){
   printf("Digite %s M_Linhas N_Colunas\n\n", argv[0]);
   exit(0);
 }
 m=atoi(argv[1]);
 n=atoi(argv[2]);
 float matC[m][n];
 /*ALOCA AS MATRIZES*/
 matA=aloca(m, n, matA);
 matB=aloca(m, n, matB);

 #ifdef IMPRIME
 printf("Antes da inicializacao!\n");
 imprime(m, n, matA);
 imprime(m, n, matB);
 //imprime(m, n, matC);
 printf("\n");
 #endif

 /*POPULA AS MATRIZES A e B*/
 inicializa(m, n, matA);
 inicializa(m, n, matB);

 #ifdef IMPRIME
 printf("Depois da inicializacao!\n");
 imprime(m, n, matA);
 imprime(m, n, matB);
 //imprime(m, n, matC);
 printf("\n");
 #endif

 /*MULTIPLICA AS MATRIZES A e B*/
 clockBegin = GetTime();
 multiplica(m, n, matA, matB, matC);
 timeElapsed = (GetTime() - clockBegin)/1000000;

 #ifdef IMPRIME
 printf("Depois da Multiplicacao!\n");
 imprime(m, n, matA);
 imprime(m, n, matB);
 //imprime(m, n, matC);
 printf("\n");
 #endif

 printf("%5lf\n", timeElapsed);

 /*DESALOCA AS MATRIZES*/
 //desaloca(m, n, matA);
 //desaloca(m, n, matB);
 //desaloca(m, n, matC);
 return 0;
}
