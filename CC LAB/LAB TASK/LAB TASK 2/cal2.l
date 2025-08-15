%option noyywrap

%{
// Roll Number: 222115190
#include "cal2.tab.h"
#include <stdlib.h>
%}

digit [0-9]
delim [ \t]

%%

{digit}{digit}* {
    yylval = atoi(yytext); return(NUM);}
"+" {return(ADD);}
"-" {return(SUB);}
"*" {return(MUL);}
"/" {return(DIV);}
"(" { return '('; }
")" { return ')'; }
"{" { return '{'; }
"}" { return '}'; }
"[" { return '['; }
"]" { return ']'; }
\n  { return '\n';}   
{delim} {}

%%
