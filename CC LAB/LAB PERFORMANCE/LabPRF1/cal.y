%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT MAIN RETURN PRINTF SCANF NUM ID
%token IF ELSE ELSEIF
%token EQ GE LE GT
%token LPAREN RPAREN LBRACE RBRACE SEMI COMMA  LT
%token ASSIGN AMP AMPP
%token STRING

%start cal

%%
cal:INT MAIN LPAREN RPAREN block ;

block:LBRACE stmts RETURN NUM SEMI RBRACE ;

stmts:stmts stmt | ;

stmt: INT ID SEMI
    | output
    | input
    | if_stm;  

output:PRINTF LPAREN STRING RPAREN SEMI;

input:SCANF LPAREN STRING COMMA AMP ID RPAREN SEMI;

if_stm :IF LPAREN con RPAREN LBRACE stmts RBRACE
| IF LPAREN con RPAREN LBRACE stmts RBRACE ELSE LBRACE stmts RBRACE
| IF LPAREN con RPAREN LBRACE stmts RBRACE ELSE IF LPAREN con RPAREN LBRACE stmts RBRACE;

op:LT|GE|LE|EQ|AMPP|;

exp : ID | NUM ;
    
con : con op exp
    | exp ;



%%

void yyerror(char *s)
{
    fprintf(stderr, "", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}