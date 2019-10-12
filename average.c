#include <stdio.h>
#include <stdlib.h>
//extern FILE* yyin;
int main(int argc, char **argv) {
  int count = 0;
  double avg = 0;
  FILE *fp = fopen(argv[1], "r");
  //yyin = fopen(argv[1],"r");
  char buffer[255];

  while(fgets(buffer, 255, fp) ){
    avg+=atof(buffer);
    count++;
}

  avg = avg/count;
  printf("%f\n", avg);
  return 0;
}
