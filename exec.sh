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


gcc mmfission.c -o mmfissionO0 -O0
for ((i=0;i<30;i++))
do
	./mmfissionO0 200 200 >> outfissionO0.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmfissionO0 200 200 >> outfissionO0perf.txt
done
gcc mmfission.c -o mmfissionO1 -O1
for ((i=0;i<30;i++))
do
	./mmfissionO1 200 200 >> outfissionO1.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmfissionO1 200 200 >> outfissionO1perf.txt
done
gcc mmfission.c -o mmfissionO2 -O2
for ((i=0;i<30;i++))
do
	./mmfissionO2 200 200 >> outfissionO2.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmfissionO2 200 200 >> outfissionO2perf.txt
done
gcc mmfission.c -o mmfissionO3 -O3
for ((i=0;i<30;i++))
do
	./mmfissionO3 200 200 >> outfissionO3.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmfissionO3 200 200 >> outfissionO3perf.txt
done



gcc mmtiling.c -o mmtilingO0 -O0
for ((i=0;i<30;i++))
do
	./mmtilingO0 200 200 >> outtilingO0.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmtilingO0 200 200 >> outtilingO0perf.txt
done
gcc mmtiling.c -o mmtilingO1 -O1
for ((i=0;i<30;i++))
do
	./mmtilingO1 200 200 >> outtilingO1.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmtilingO1 200 200 >> outtilingO1perf.txt
done
gcc mmtiling.c -o mmtilingO2 -O2
for ((i=0;i<30;i++))
do
	./mmtilingO2 200 200 >> outtilingO2.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmtilingO2 200 200 >> outtilingO2perf.txt
done
gcc mmtiling.c -o mmtilingO3 -O3
for ((i=0;i<30;i++))
do
	./mmtilingO3 200 200 >> outtilingO3.txt
done
for ((i=0;i<30;i++))
do
	sudo perf stat ./mmtilingO3 200 200 >> outtilingO3perf.txt
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

./avg outfissionO0.txt > avgFissionO0.txt
./avg outfissionO1.txt > avgFissionO1.txt
./avg outfissionO2.txt > avgFissionO2.txt
./avg outfissionO3.txt > avgFissionO3.txt

./avg outfissionO0perf.txt > avgFissionperfO0.txt
./avg outfissionO1perf.txt > avgFissionperfO1.txt
./avg outfissionO2perf.txt > avgFissionperfO2.txt
./avg outfissionO3perf.txt > avgFissionperfO3.txt

./avg outtilingO0.txt > avgtilingO0.txt
./avg outtilingO1.txt > avgtilingO1.txt
./avg outtilingO2.txt > avgtilingO2.txt
./avg outtilingO3.txt > avgtilingO3.txt

./avg outtilingO0perf.txt > avgtilingperfO0.txt
./avg outtilingO1perf.txt > avgtilingperfO1.txt
./avg outtilingO2perf.txt > avgtilingperfO2.txt
./avg outtilingO3perf.txt > avgtilingperfO3.txt

rm mmO0 mmluO0 mmO1 mmluO1 mmO2 mmluO2 mmO3 mmluO3 mmfissionO0 mmfissionO1  mmfissionO2  mmfissionO3 mmtilingO0 mmtilingO1 mmtilingO2 mmtilingO3 avg out*.txt
