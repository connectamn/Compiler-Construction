input = input.txt
output = output.txt

input2 = input2.txt
output2 = output2.txt

main: cal.l cal.y
	bison -d cal.y 
	flex cal.l 
	gcc cal.tab.c lex.yy.c
	./a.exe <$(input)> $(output)

main2: cal2.l cal2.y
	bison -d cal2.y 
	flex cal2.l 
	gcc cal2.tab.c lex.yy.c
	./a.exe <$(input2)> $(output2)
	


