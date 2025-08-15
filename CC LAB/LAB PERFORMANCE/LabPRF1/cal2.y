%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT MAIN DO WHILE FOR PRINTF SCANF RETURN
%token ID NUM STRING CHAR
%token LPAREN RPAREN LBRACE RBRACE SEMI COMMA
%token ASSIGN MUL AMP OR EQ LE INC

%start program

%%

program: INT MAIN LPAREN RPAREN block ;

block: LBRACE dclr_stmt stmts RETURN NUM SEMI RBRACE ;

dclr_stmt: dclr
            | dclr_stmt dclr
            | ;

dclr: INT ID SEMI
           | CHAR ID SEMI ;

stmts: stmts stmt
     | ;

stmt: do_stmt
    | output
    | input
    | for_stmt ;

do_stmt: DO LBRACE stmts RBRACE WHILE LPAREN con RPAREN SEMI ;

for_stmt: FOR LPAREN INT ID ASSIGN NUM SEMI ID LE NUM SEMI ID INC RPAREN LBRACE stmts RBRACE ;

con: ID EQ CHAR OR ID EQ CHAR ;

output: PRINTF LPAREN STRING RPAREN SEMI
      | PRINTF LPAREN STRING COMMA ID RPAREN SEMI
      | PRINTF LPAREN STRING COMMA ID COMMA ID RPAREN SEMI
      | PRINTF LPAREN STRING COMMA ID COMMA ID COMMA expr RPAREN SEMI ;

input: SCANF LPAREN STRING COMMA AMP ID RPAREN SEMI ;

expr: ID MUL ID
    | ID  | NUM ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    printf("\n Parsing Finished");
    return 0;
}
