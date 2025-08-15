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
char    \'.\'

%%

"int"           { return INT; }
"main"          { return MAIN; }
"do"            { return DO; }
"while"         { return WHILE; }
"for"           { return FOR; }
"printf"        { return PRINTF; }
"scanf"         { return SCANF; }
"return"        { return RETURN; }

"=="            { return EQ; }
"||"            { return OR; }
"<="            { return LE; }
"++"            { return INC; }
"*"             { return MUL; }
"="             { return ASSIGN; }
"&"             { return AMP; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMI; }
","             { return COMMA; }

{char}          { return CHAR; }
\"[^\"\n]*\"    { return STRING; }
{num}           { yylval = atoi(yytext); return NUM; }
{id}            { return ID; }

[ \t\n]         ; 
.               ; 

%%
