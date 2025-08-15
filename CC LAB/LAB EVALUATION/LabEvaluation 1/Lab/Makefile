input = input.txt
output = output.txt

main:
	flex prog2.l
	gcc lex.yy.c -o p
	./p < $(input) > $(output)




