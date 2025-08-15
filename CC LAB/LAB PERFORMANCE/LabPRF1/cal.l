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

"int"           { return INT; }
"main"          { return MAIN; }
"return"        { return RETURN; }
"printf"        { return PRINTF; }
"scanf"         { return SCANF; }
"if"            { return IF; }
"else"          { return ELSE; }
"else if"       { return ELSEIF; }


"=="            { return EQ; }
">="            { return GE; }
"<="            { return LE; }
"<"             { return LT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMI; }
","             { return COMMA; }
"="             { return ASSIGN; }
"&"             { return AMP; }
"&&"            { return AMPP; }



\"([^\"\n]|\\.)*\"   { return STRING; }
{num}               { yylval = atoi(yytext); return(NUM); }

({under}|{letter})({under}|{letter}|{digit})* { return (ID); }


%%