#!/bin/bash
gcc mm.c -o mmO0 -O0
for ((i=0;i<30;i++))
do
	./mmO0 200 200 >> outoriginalO0.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmO0 200 200 >> outoriginalO0perf.txt
done
gcc mm.c -o mmO1 -O1
for ((i=0;i<30;i++))
do
	./mmO1 200 200 >> outoriginalO1.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmO1 200 200 >> outoriginalO1perf.txt
done
gcc mm.c -o mmO2 -O2
for ((i=0;i<30;i++))
do
	./mmO2 200 200 >> outoriginalO2.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmO2 200 200 >> outoriginalO2perf.txt
done
gcc mm.c -o mmO3 -O3
for ((i=0;i<30;i++))
do
	./mmO3 200 200 >> outoriginalO3.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmO3 200 200 >> outoriginalO3perf.txt
done



gcc mmloopunrolling.c -o mmluO0 -O0
for ((i=0;i<30;i++))
do
	./mmluO0 200 200 >> outluO0.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmluO0 200 200 >> outluO0perf.txt
done
gcc mmloopunrolling.c -o mmluO1 -O1
for ((i=0;i<30;i++))
do
	./mmluO1 200 200 >> outluO1.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmluO1 200 200 >> outluO1perf.txt
done
gcc mmloopunrolling.c -o mmluO2 -O2
for ((i=0;i<30;i++))
do
	./mmluO2 200 200 >> outluO2.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmluO2 200 200 >> outluO2perf.txt
done
gcc mmloopunrolling.c -o mmluO3 -O3
for ((i=0;i<30;i++))
do
	./mmluO3 200 200 >> outluO3.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmluO3 200 200 >> outluO3perf.txt
done

gcc mmvectorized.c -o mmvectorizedO0 -O0
for ((i=0;i<30;i++))
do
	./mmvectorizedO0 200 200 >> outvectorizedO0.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmvectorizedO0 200 200 >> outvectorizedO0perf.txt
done
gcc mmvectorized.c -o mmvectorizedO1 -O1
for ((i=0;i<30;i++))
do
	./mmvectorizedO1 200 200 >> outvectorizedO1.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmvectorizedO1 200 200 >> outvectorizedO1perf.txt
done
gcc mmvectorized.c -o mmvectorizedO2 -O2
for ((i=0;i<30;i++))
do
	./mmvectorizedO2 200 200 >> outvectorizedO2.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmvectorizedO2 200 200 >> outvectorizedO2perf.txt
done
gcc mmvectorized.c -o mmvectorizedO3 -O3
for ((i=0;i<30;i++))
do
	./mmvectorizedO3 200 200 >> outvectorizedO3.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmvectorizedO3 200 200 >> outvectorizedO3perf.txt
done



gcc average.c -o avg
./avg outoriginalO0.txt > avgOrigO0.txt
./avg outoriginalO1.txt > avgOrigO1.txt
./avg outoriginalO2.txt > avgOrigO2.txt
./avg outoriginalO3.txt > avgOrigO3.txt

./avg outoriginalO0perf.txt > avgOrigperfO0.txt
./avg outoriginalO1perf.txt > avgOrigperfO1.txt
./avg outoriginalO2perf.txt > avgOrigperfO2.txt
./avg outoriginalO3perf.txt > avgOrigperfO3.txt

./avg outluO0.txt > avgluO0.txt
./avg outluO1.txt > avgluO1.txt
./avg outluO2.txt > avgluO2.txt
./avg outluO3.txt > avgluO3.txt

./avg outluO0perf.txt > avgluperfO0.txt
./avg outluO1perf.txt > avgluperfO1.txt
./avg outluO2perf.txt > avgluperfO2.txt
./avg outluO3perf.txt > avgluperfO3.txt

./avg outvectorizedO0.txt > avgVectO0.txt
./avg outvectorizedO1.txt > avgVectO1.txt
./avg outvectorizedO2.txt > avgVectO2.txt
./avg outvectorizedO3.txt > avgVectO3.txt

./avg outvectorizedO0perf.txt > avgVectperfO0.txt
./avg outvectorizedO1perf.txt > avgVectperfO1.txt
./avg outvectorizedO2perf.txt > avgVectperfO2.txt
./avg outvectorizedO3perf.txt > avgVectperfO3.txt

rm mmO0 mmluO0 mmO1 mmluO1 mmO2 mmluO2 mmO3 mmluO3 mmvectorizedO0 mmvectorizedO1  mmvectorizedO2  mmvectorizedO3 avg
