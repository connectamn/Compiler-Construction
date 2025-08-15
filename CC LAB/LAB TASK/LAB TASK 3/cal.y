%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_NUM FLOAT_NUM INT_TYPE FLOAT_TYPE SEMI ASSIGN ID
%start stmts

%%
stmts : stmt stmts | ;

stmt : dclr_stmt | ass_stmt;

dclr_stmt : TYPE ID SEMI
        |   TYPE ID ASSIGN NUM SEMI ;

ass_stmt : ID ASSIGN NUM SEMI;

TYPE : INT_TYPE | FLOAT_TYPE ;

NUM: INT_NUM | FLOAT_NUM;


%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

