%{
    #include "parser.h"
    #include <stdio.h>
%}

%option noinput
%option nounput

%%
"void" {return VOID;}
"int"|"char" {return TYPE;}
"+"|"-" {return ADDSUB;}
"*"|"/"|"%" {return DIVSTAR;}
"=="|"!=" {return EQ;}
"<"|"<="|">"|">=" {return ORDER;}
"if" {return IF;}
"else" {return ELSE;}
"&&" {return AND;}
"||" {return OR;}
"return" {return RETURN;}
'.'|'\n'|'\t' {return CHARACTER;}
[0-9] {return NUM;}
[a-zA-Z_]*[a-zA-Z0-9_]* {return IDENT;}
[ \t\n] ;
"//".*  ;
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] ;
. {return *yytext;}
%%