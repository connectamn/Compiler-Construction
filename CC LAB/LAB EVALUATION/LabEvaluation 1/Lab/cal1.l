%option noyywrap

%{
//Roll Number: 222115190
//
%}

digit [0-9]
delim [ \t]

%%
{digit}{digit}* {printf("%s -> NUMBER\n", yytext);}
"+" {printf("%s -> ADD\n", yytext);}
"-" {printf("%s -> SUB\n", yytext); }
"*" {printf("%s -> MUL\n", yytext); }
"/" {printf("%s -> DIV\n", yytext); }
\" {printf("%s -> QUOTE\n", yytext);}
{delim} {}
%%

int main()
{
  yylex();
  return 0;
}
