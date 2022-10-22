%option nounput
%option noyywrap

%{
    #include "grammaire.tab.h"
%}

%%

"("             return OUV;
")"             return FER;
"+"             return PLUS;
"*"             return FOIS;
"/"             return DIV;
\n              return NEWLINE;
"-"             return MOINS;

[0-9]+ { 
    yylval = atoi(yytext);
    return ENTIER;
}

[[:space:]] ;

. fprintf(stderr, "Erreur lex : %s\n", yytext);

%%