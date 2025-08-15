input = input.txt
output = output.txt

input2 = input2.txt
output2 = output2.txt

main:
	flex prog2.l
	gcc lex.yy.c -o a
	./a < $(input) > $(output)



main2:
	bison -d cal2.y
	flex cal2.l
	gcc cal2.tab.c lex.yy.c -o p
	./p < $(input2) > $(output2)


