%option noyywrap

%{

%}

letter [a-zA-Z]
digit [0-9]
delim [ \t]
under [_]
num {digit}{digit}*
float_num {num}*[.]{num}
sci_num ([-+])?({digit}*(\.{digit}+)?([eE]([-+])?{digit}+))
%%
{num} {printf("%s -> NUMBER\n", yytext);}
"+" {printf("%s -> ADD\n", yytext);}
"int" {printf("%s -> INT\n", yytext);}
"char" {printf("%s -> CHARACTER\n", yytext);}
"float" {printf("%s -> FLOAT\n", yytext);}
"double" {printf("%s -> DOUBLE\n", yytext);}
"while" {printf("%s -> WHILE\n", yytext);}
"for" {printf("%s -> FOR\n", yytext);}
"return" {printf("%s -> RETURN\n", yytext);}
"printf" {printf("%s -> PRINTF\n", yytext);}
"scanf" {printf("%s -> SCANF\n", yytext);}
"(" {printf("%s -> LP\n", yytext);}
")" {printf("%s -> RP\n", yytext);}
"{" {printf("%s -> LB\n", yytext);}
"}" {printf("%s -> RB\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext);}
"<=" {printf("%s -> GREATER THAN OR EQUAL\n", yytext);}
";" {printf("%s -> SEMI\n", yytext);}
"," {printf("%s -> COMMA\n", yytext);}
"&" {printf("%s -> AMPERSAND\n", yytext);}
({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n", yytext);}
\"([^\\\"]|\\.)*\" {printf("%s -> STRING\n", yytext);}
\'([^\\\']|\\.)*\' {printf("%s -> STRING\n", yytext);}
{float_num} {printf("%s -> FLOAT_NUM\n", yytext);}
{sci_num} {printf("%s -> SCI_NUM\n", yytext); }
{delim} {}
%%

int main()
{
  yylex();
  return 0;
}