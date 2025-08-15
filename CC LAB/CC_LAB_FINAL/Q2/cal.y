%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%union {
    int num;
    char* str;
}

%token <num> NUM
%token <str> ID STR
%token INT FLOAT MAIN RETURN SCANF PRINTF SWITCH CASE DEFAULT BREAK
%token LPAREN RPAREN LBRACE RBRACE SEMI COLON COMMA AMP EQ DIV ADD SUB MULT
%token IF ELSE FOR ASSIGN GT LT GTE LTE NEQ LEFTSQUAREBRACKET RIGHTSQUAREBRACKET DOT MOD INCREMENT

%start program

%%

program : stmt_list ; 

stmt_list : stmt stmt_list | stmt ;

stmt : declr_stmt | for_stmt | if_stmt 
    | switch_stmt | assign_stmt | array_declr_stmt ;


declr_stmt : FLOAT decl_list SEMI ;

decl_list : single_decl
          | single_decl COMMA decl_list ;

single_decl : ID
            | ID ASSIGN NUM ;


array_declr_stmt : INT ID LEFTSQUAREBRACKET NUM RIGHTSQUAREBRACKET ASSIGN LBRACE num_list RBRACE SEMI ;

num_list : NUM | NUM COMMA num_list ;



for_stmt : FOR LPAREN INT ID ASSIGN NUM SEMI ID LT NUM SEMI ID INCREMENT RPAREN LBRACE stmt_list RBRACE ;

if_stmt : IF LPAREN expr RPAREN LBRACE stmt_list RBRACE
        | IF LPAREN expr RPAREN LBRACE stmt_list RBRACE ELSE LBRACE stmt_list RBRACE ;


switch_stmt : SWITCH LPAREN ID RPAREN LBRACE case_list default_case RBRACE ;

case_list : case_stmt case_list 
          | case_stmt ;

 case_stmt : CASE NUM COLON assign_stmt BREAK SEMI ;

  default_case : DEFAULT COLON assign_stmt ;


assign_stmt : ID ASSIGN expr SEMI
            | ID ASSIGN SUB NUM SEMI ;

 expr : expr ADD primary
     | primary
     | ID GT NUM ;

primary : ID
        | NUM
        | ID LEFTSQUAREBRACKET ID RIGHTSQUAREBRACKET ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing for problem 2 finished \n");
    return 0;
}
