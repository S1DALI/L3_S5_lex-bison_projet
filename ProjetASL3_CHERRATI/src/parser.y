%{
    #include <stdio.h>
    #include <unistd.h>
    int yylex();
    int yyerror(const char* msg);   
%}

%token TYPE VOID EQ ORDER ADDSUB DIVSTAR IF WHILE
%token OR RETURN NUM CHARACTER IDENT AND ELSE

%%
Prog:  DeclVarsGlob DeclFoncts
    ;
DeclVarsGlob:
       DeclVarsGlob TYPE DeclarateursGlob ';'
    |
    ;
DeclarateursGlob:
       DeclarateursGlob ',' IDENT
    |  IDENT
    ;
DeclVarsLoc:
        DeclVarsLoc TYPE DeclarateursLoc ';'
    |
    ;
DeclarateursLoc:
       DeclarateursLoc ',' IDENT
    |  IDENT
    |  IDENT '=' Exp
    |  DeclarateursLoc ',' IDENT '=' Exp
    ;
DeclFoncts:
       DeclFoncts DeclFonct
    |  DeclFonct
    ;
DeclFonct:
       EnTeteFonct Corps
    ;
EnTeteFonct:
       TYPE IDENT '(' Parametres ')'
    |  VOID IDENT '(' Parametres ')'
    ;
Parametres:
       VOID
    |  ListTypVar
    ;
ListTypVar:
       ListTypVar ',' TYPE IDENT
    |  TYPE IDENT
    ;
Corps: '{' DeclVarsLoc SuiteInstr '}'
    ;
SuiteInstr:
       SuiteInstr Instr
    |
    ;
Instr:
       LValue '=' Exp ';'
    |  IF '(' Exp ')' Instr
    |  IF '(' Exp ')' Instr ELSE Instr
    |  WHILE '(' Exp ')' Instr
    |  IDENT '(' Arguments  ')' ';'
    |  RETURN Exp ';'
    |  RETURN ';'
    |  '{' SuiteInstr '}'
    |  ';'
    ;
Exp :  Exp OR TB
    |  TB
    ;
TB  :  TB AND FB
    |  FB
    ;
FB  :  FB EQ M
    |  M
    ;
M   :  M ORDER E
    |  E
    ;
E   :  E ADDSUB T
    |  T
    ;    
T   :  T DIVSTAR F 
    |  F
    ;
F   :  ADDSUB F
    |  '!' F
    |  '(' Exp ')'
    |  NUM
    |  CHARACTER
    |  LValue
    |  IDENT '(' Arguments  ')'
    ;
LValue:
       IDENT
    ;
Arguments:
       ListExp
    |
    ;
ListExp:
       ListExp ',' Exp
    |  Exp
    ;
%%
int main(int argc, char *argv[]){
    int opt;
    while((opt = getopt(argc, argv, "th")) != -1){
        switch(opt){
            case 't':
                printf("tree is not available for now !\n");
                break;
            case 'h':
                printf("To give a file to the progrm you can use ./tpcas < FILE.tpc\nto print out a tree use the command ./tpcas -t < FILE.tpc \n");
                break;
        }
    }
    yyparse();
    return 0;
}
int yyerror(const char* msg){
    printf("Parsing syntax error\n");
    return 1;
}