%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(const char * error);
%}


%start S
%token c
%token d

%%
S                   : C C
C                   : c C | d
%%


void yyerror(const char * error)
{
    fprintf(stderr, "Erreur yacc: %s\n", error);
}