input = input.txt
output = output.txt

input2 = input2.txt
output2 = output2.txt

main: cal.l cal.y
	bison -d cal.y 
	flex cal.l 
	gcc cal.tab.c lex.yy.c symtab.c
	./a.exe <$(input) >$(output)


