%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT MAIN RETURN SCANF PRINTF SWITCH CASE DEFAULT BREAK ID NUM STR
%token LPAREN RPAREN LBRACE RBRACE SEMI COLON COMMA AMP EQ DIV

%start stmt

%%

stmt : INT MAIN LPAREN RPAREN block ;
block : LBRACE stmts RETURN NUM SEMI RBRACE ;
stmts : stmt stmts |  ;

stmt : declr_stmt | input_stmt
     | output_stmt| switch_stmt ;

declr_stmt : INT ID SEMI ;

input_stmt : SCANF LPAREN STR COMMA AMP ID RPAREN SEMI ;
output_stmt : PRINTF LPAREN STR RPAREN SEMI ;
switch_stmt : SWITCH LPAREN expr RPAREN LBRACE case_list default_case RBRACE ;

case_list : case_labels stmt_list BREAK SEMI case_list
          | case_labels stmt_list BREAK SEMI ;

case_labels : CASE NUM COLON case_labels
            | CASE NUM COLON ;

default_case : DEFAULT COLON stmt_list BREAK SEMI ;

stmt_list : output_stmt
          | stmt_list output_stmt ;

expr : ID DIV NUM ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished Prob 1\n");
    return 0;
}
