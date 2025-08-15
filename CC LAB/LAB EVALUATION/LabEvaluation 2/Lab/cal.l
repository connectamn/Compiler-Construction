%option noyywrap

%{
#include "cal.tab.h"
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
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }
"break"     { return BREAK; }

"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMI; }
":"         { return COLON; }
","         { return COMMA; }
"&"         { return AMP; }
"="         { return EQ; }
"/"         { return DIV; }


{num} {yylval = atoi(yytext); return(NUM);}
\".*\"      { return STR; }


({under}|{letter})({under}|{letter}|{digit})* {return (ID);}

[ \t\n\r]+  ;  // skip whitespace



%%
