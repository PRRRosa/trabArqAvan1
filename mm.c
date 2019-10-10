#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>
#include <sys/time.h>
//#define IMPRIME

void multiplica(int m, int n, int **matA, int **matB, int **matC){
	int i, j, k, som;
	/*for(j=0;j<n;j++){
		for (i=0;i<m;i++){*/
	for (i=0;i<m;i+=10){
		for(j=0;j<n;j+=10){
			for(k=0; k<m; k+=10){
				matC[i][j]+= matA[i][k]*matB[k][j];
				matC[i+1][j+1]+= matA[i+1][k+1]*matB[k+1][j+1];
				matC[i+2][j+2]+= matA[i+2][k+2]*matB[k+2][j+2];
				matC[i+3][j+3]+= matA[i+3][k+3]*matB[k+3][j+3];
				matC[i+4][j+4]+= matA[i+4][k+4]*matB[k+4][j+4];
				matC[i+5][j+5]+= matA[i+5][k+5]*matB[k+5][j+5];
				matC[i+6][j+6]+= matA[i+6][k+6]*matB[k+6][j+6];
				matC[i+7][j+7]+= matA[i+7][k+7]*matB[k+7][j+7];
				matC[i+8][j+8]+= matA[i+8][k+8]*matB[k+8][j+8];
				matC[i+9][j+9]+= matA[i+9][k+9]*matB[k+9][j+9];
			}
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
