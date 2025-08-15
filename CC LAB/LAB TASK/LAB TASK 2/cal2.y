%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB MUL DIV
%left MUL DIV 
%left ADD SUB 

%start cal

%%

cal: cal exp '\n' 
    { printf("Result = %d\n", $2); }
    |;

exp: exp ADD exp    { $$ = $1 + $3; }
    | exp SUB exp   { $$ = $1 - $3; }
    | exp MUL exp   { $$ = $1 * $3; }
    | exp DIV exp   { $$ = $1 / $3; }
    | '(' exp ')'   { $$ = $2; }
    | '{' exp '}'   { $$ = $2; }
    | '[' exp ']'   { $$ = $2; }
    | NUM           { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
