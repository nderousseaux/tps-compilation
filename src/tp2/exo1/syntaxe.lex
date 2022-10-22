%option nounput
%option noyywrap

%{
    #include "grammaire.tab.h"
%}

%%

"(" return yytext[0];
")" return yytext[0];

[0-9]+ { 
    yylval = atoi(yytext);
    return 1;
}

[[:space:]] ;

. fprintf(stderr, "Caractère illégal (%d) ignoré\n", yytext[0]);

%%