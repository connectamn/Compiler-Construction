%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.h"
    extern int lineno;
    void yyerror(const char *);
    extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INT FLOAT DOUBLE CHAR IF ELSE WHILE CONTINUE BREAK PRINT
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token <str_val> ID
%token ICONST
%token FCONST
%token CCONST

%left LT GT
%left ADDOP SUBOP
%left MULOP DIVOP
%right ASSIGN
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%type<int_val> type exp constant

%start code

%%
code:
    statements
    ;

statements:
    statements statement
    |
    ;

statement:
    declaration
    | if_statement
    | ass_stmt
    ;

declaration:
    type ID SEMI
        { insert($2, $1); }
    | type ID ASSIGN exp SEMI
        { insert($2, $1); }
    ;

type:
    INT    { $$ = INT_TYPE; }
    | FLOAT  { $$ = REAL_TYPE; }
    | DOUBLE { $$ = REAL_TYPE; }
    | CHAR   { $$ = CHAR_TYPE; }
    ;

exp:
    constant
        { $$ = $1; }
    | ID
        {
            if(idcheck($1))
                $$ = gettype($1);
            else
                $$ = UNDEF_TYPE;
        }
    | exp ADDOP exp
        { $$ = typecheck($1, $3); }
    | exp SUBOP exp
        { $$ = typecheck($1, $3); }
    | exp MULOP exp
        { $$ = typecheck($1, $3); }
    | exp DIVOP exp
        { $$ = typecheck($1, $3); }
    | exp GT exp
        { $$ = typecheck($1, $3); }
    | exp LT exp
        { $$ = typecheck($1, $3); }
    | LPAREN exp RPAREN
        { $$ = $2; }
    ;

constant:
    ICONST { $$ = INT_TYPE; }
    | FCONST { $$ = REAL_TYPE; }
    | CCONST { $$ = CHAR_TYPE; }
    ;

ass_stmt:
    ID ASSIGN exp SEMI ;

if_statement:
    IF LPAREN exp RPAREN statement %prec LOWER_THAN_ELSE
    | IF LPAREN exp RPAREN statement ELSE statement
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Syntax error at line %d: %s\n", lineno, s);
    exit(1);
}

int main(int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");
    return 0;
}
