%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT MAIN RETURN
%token SCANF PRINTF IF ELSE ID NUM STR
%token ASSI EQ MOD LPAREN RPAREN LBRACE RBRACE SEMI COLON COMMA AMP

%right ELSE
%nonassoc LOWER_THAN_ELSE

%start program

%%

program : INT MAIN LPAREN RPAREN block ;
block : LBRACE stmts RETURN NUM SEMI RBRACE 
      | LBRACE output_stmt RBRACE
      ;

stmts : stmt stmts |  ;

stmt : decl_stmt
     | input_stmt
     | output_stmt
     | if_stmt ;

decl_stmt : INT ID SEMI ;

input_stmt : SCANF LPAREN STR COMMA AMP ID RPAREN SEMI ;

output_stmt : PRINTF LPAREN STR COMMA ID RPAREN SEMI 
            | PRINTF LPAREN STR RPAREN SEMI
            ;

if_stmt
    : IF LPAREN condition RPAREN block %prec LOWER_THAN_ELSE
    | IF LPAREN condition RPAREN block ELSE block
    | IF LPAREN condition RPAREN block ELSE if_stmt
    ;

condition : ID MOD NUM EQ NUM ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished prob2\n");
    return 0;
}
