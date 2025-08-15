all:
	gcc -o File1 File1.c
	gcc -E File1.c > File1.i 
	gcc -S -masm=intel File1.i
	as -o File1.o File1.s
	objdump -M intel -d File1.o > File1.dump
	file1.exe
