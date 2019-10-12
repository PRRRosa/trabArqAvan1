#!/bin/bash
gcc mm.c -o mm
for ((i=0;i<30;i++))
do
	./mm 200 200 >> outoriginal.txt
done
gcc mmloopunrolling.c -o mmlu
for ((i=0;i<30;i++))
do
	./mmlu 200 200 >> outlu.txt
done
