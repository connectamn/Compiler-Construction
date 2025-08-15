%option noyywrap

%{
#include "cal2.tab.h"
#include <stdlib.h>
%}

digit   [0-9]
letter  [a-zA-Z]
under   [_]
id      ({under}|{letter})({under}|{letter}|{digit})*
num     {digit}+

%%

"int"       { return INT; }
"main"      { return MAIN; }
"return"    { return RETURN; }

"scanf"     { return SCANF; }
"printf"    { return PRINTF; }

"if"        { return IF; }
"else"      { return ELSE; }

"=="        { return EQ; }

"%"         { return MOD; }
"&"         { return AMP; }

"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMI; }
","         { return COMMA; }

{num}       { yylval = atoi(yytext); return NUM; }
\".*\"      { return STR; }
{id}        { return ID; }

[ \t\n\r]+  ;  // skip whitespace

.           { /* ignore unknown characters */ }

%%
