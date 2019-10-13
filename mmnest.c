#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>
#include <sys/time.h>
//#define IMPRIME

void multiplica(int m, int n, int **matA, int **matB, int **matC){
	int i,ii,kk, j, k, som;
	int acc00,acc01,acc10,acc11;

	for (i = 0; i < m; i += 2)
	{
	    for (j = 0; j < n; j += 2)
	    {
	        acc00 = acc01 = acc10 = acc11 = 0;
	        for (k = 0; k < m; k++)
	        {
	            acc00 += matB[k][j + 0] * matA[i + 0][k];
	            acc01 += matB[k][j + 1] * matA[i + 0][k];
	            acc10 += matB[k][j + 0] * matA[i + 1][k];
	            acc11 += matB[k][j + 1] * matA[i + 1][k];
	        }
	        matC[i + 0][j + 0] = acc00;
	        matC[i + 0][j + 1] = acc01;
	        matC[i + 1][j + 0] = acc10;
	        matC[i + 1][j + 1] = acc11;
	    }
	}

}

int **aloca(int m, int n, int **matriz){
	int i;
	matriz=(int**)calloc(m, sizeof(int*));
	for(i=0;i<m;i++){
		matriz[i]=(int*)calloc(n, sizeof(int));
	}
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

void inicializa(int m, int n, int **matriz){
	int i, j;
	for (i=0;i<m;i++){
		for(j=0;j<n;j++){
			matriz[i][j]=i+j;
		}
	}
}


void desaloca(int m, int n, int **matriz){
	int i;
	for(i=0;i<m;i++){
		free(matriz[i]);
	}
	free(matriz);
}

int main (int argc, char *argv[]) {
	int **matA,**matB,**matC;
	int m,n,i,j,k; // m(linhas) e n (colunas)
	double clockBegin;
	double timeElapsed;
	if(argc!=3){
		printf("Digite %s M_Linhas N_Colunas\n\n", argv[0]);
		exit(0);
	}
	m=atoi(argv[1]);
	n=atoi(argv[2]);

	/*ALOCA AS MATRIZES*/
	matA=aloca(m, n, matA);
	matB=aloca(m, n, matB);
	matC=aloca(m, n, matC);

	#ifdef IMPRIME
	printf("Antes da inicializacao!\n");
	imprime(m, n, matA);
	imprime(m, n, matB);
	imprime(m, n, matC);
	printf("\n");
	#endif

	/*POPULA AS MATRIZES A e B*/
	inicializa(m, n, matA);
	inicializa(m, n, matB);

	#ifdef IMPRIME
	printf("Depois da inicializacao!\n");
	imprime(m, n, matA);
	imprime(m, n, matB);
	imprime(m, n, matC);
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
	imprime(m, n, matC);
	printf("\n");
	#endif
	printf("%5lf\n", timeElapsed);

	/*DESALOCA AS MATRIZES*/
	desaloca(m, n, matA);
	desaloca(m, n, matB);
	desaloca(m, n, matC);
	return 0;
}
