%option noyywrap

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "cal.tab.h"
    
    int lineno = 1;
    void yyerror(const char *);
%}

alpha       [a-zA-Z]
digit       [0-9]
alnum       ({alpha}|{digit})
print       [ -~]

ID          {alpha}({alnum})*
ICONST      {digit}+
FCONST      {digit}*"."{digit}+
CCONST      (\'{print}\')

%%

"//".*                  { }

"int"                   { return INT; }
"float"                 { return FLOAT; }
"double"                { return DOUBLE; }
"char"                  { return CHAR; }

"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"continue"              { return CONTINUE; }
"break"                 { return BREAK; }
"print"                 { return PRINT; }

"+"                     { return ADDOP; }
"-"                     { return SUBOP; }
"*"                     { return MULOP; }
"/"                     { return DIVOP; }
"=="                    { return EQUOP; }
">"                     { return GT; }
"<"                     { return LT; }

"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
";"                     { return SEMI; }
"="                     { return ASSIGN; }

{ID}                    { strcpy(yylval.str_val, yytext); return ID; }
{ICONST}                { return ICONST; }
{FCONST}                { return FCONST; }
{CCONST}                { return CCONST; }

"\n"                    { lineno++; }
[ \t\r\f]+              { /* skip whitespace */ }

.                       { yyerror("Unrecognized character"); }

%%
