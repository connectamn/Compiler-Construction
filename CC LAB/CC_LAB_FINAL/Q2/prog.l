%option noyywrap

%{

%}

letter [a-zA-Z]
st [a-zA-Z%:' '0-9]
digit [0-9]
delim [ \t]
under [_]
num {digit}{digit}*
float_num {num}*[.]{num}
sci_num ([-+])?({digit}*(.{digit}+)?([eE]([-+])?{digit}+))
%%
{num} {printf("%s -> NUMBER\n", yytext);}
"+" {printf("%s -> ADD\n", yytext);}
"++" {printf("%s -> INC\n", yytext);}
"-" {printf("%s -> SUB\n", yytext); }
"*" {printf("%s -> MUL\n", yytext); }
"/" {printf("%s -> DIV\n", yytext); }
"<" {printf("%s -> GR\n", yytext); }
">" {printf("%s -> LT\n", yytext); }
"int" {printf("%s -> INT\n", yytext);}
"Int" {printf("%s -> INT\n", yytext);}
"float" {printf("%s -> FLOAT\n", yytext);}
"double" {printf("%s -> DOUBLE\n", yytext);}
"char" {printf("%s -> CHAR\n", yytext);}
"while" {printf("%s -> WHILE\n", yytext);}
"return" {printf("%s -> RETURN\n", yytext);}
"main" {printf("%s -> MAIN_FUNC\n", yytext);}
"printf" {printf("%s -> PRINTF\n", yytext);}
"scanf" {printf("%s -> SCANF\n", yytext);}
"(" {printf("%s -> LP\n", yytext);}
")" {printf("%s -> RP\n", yytext);}
"{" {printf("%s -> LB\n", yytext);}
"}" {printf("%s -> RB\n", yytext);}
"[" {printf("%s -> LEFTSQUAREBRACKET\n", yytext);}
"]" {printf("%s -> rEFTBT\n", yytext);}


"=" {printf("%s -> ASSIGN\n", yytext);}
";" {printf("%s -> SEMI\n", yytext);}
":" {printf("%s -> COLON\n", yytext);}
"%" {printf("%s -> PERCENT/MOD\n", yytext);}
"," {printf("%s -> COMA\n", yytext);}
"&" {printf("%s -> AMPERSAND\n", yytext);}
\" {printf("%s -> QUOTE\n", yytext);}
\’ {printf("%s -> RIGHT APO\n", yytext);}
\‘ {printf("%s -> LEFT APO\n", yytext);}
\“ {printf("%s -> LEFT DOUBLE QUOTE\n", yytext);}
\” {printf("%s -> RIGHT DOUBLE QUOTE\n", yytext);}


({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n", yytext);}
\'{letter}\'  { printf("%s -> Single_char\n", yytext); }
\"[^\"]*\"    { printf("%s -> STRING\n", yytext); }
{float_num} {printf("%s -> FLOAT_NUM\n", yytext);}
{sci_num} {printf("%s -> SCI_NUM\n", yytext); }
{delim} {}
%%

int main()
{
  yylex();
  return 0;
}
