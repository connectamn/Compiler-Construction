%option noyywrap

%{
#include "cal.tab.h"
#include <stdlib.h>
%}

digit   [0-9]
id      [a-zA-Z_][a-zA-Z0-9_]*
delim   [ \t\n]
float_num {digit}+\.{digit}+

%%

"int"           { return INT; }
"float"         { return FLOAT; }
"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { return BREAK; }
"return"        { return RETURN; }
"scanf"         { return SCANF; }
"printf"        { return PRINTF; }

"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"["             { return LEFTSQUAREBRACKET; }
"]"             { return RIGHTSQUAREBRACKET; }
";"             { return SEMI; }
":"             { return COLON; }
","             { return COMMA; }
"="             { return ASSIGN; }
"=="            { return EQ; }
"!="            { return NEQ; }
">"             { return GT; }
"<"             { return LT; }
">="            { return GTE; }
"<="            { return LTE; }
"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MULT; }
"/"             { return DIV; }
"%"             { return MOD; }
"&"             { return AMP; }
"++"            { return INCREMENT; }
"."             { return DOT; }

{float_num}     { yylval.num = atof(yytext); return NUM; }
{digit}+        { yylval.num = atoi(yytext); return NUM; }
{id}            { yylval.str = strdup(yytext); return ID; }
\"[^\"]*\"      { yylval.str = strdup(yytext); return STR; }

{delim}         { /* ignore whitespace */ }
.               { /* ignore other characters */ }

%%
