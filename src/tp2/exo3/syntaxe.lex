%option nounput
%option noyywrap

%{
    #include <stdio.h>
    #include "grammaire.tab.h"
%}

%%

[a-z]       { //On met dans yylval la valeur de l'identifiant
                yylval = yytext[0]-97;
                return IDENT;
            }
[A-Z]       { //On met dans yylval la valeur de l'identifiant (non sensible à la casse)
                yylval = yytext[0]-65;
                return IDENT;
            }
            
\{         { return OBRACE; }
\}         { return CBRACE; }

:=         { return ASSIGN; }
,          { return SEPARATEUR; }

(0?[1-9])|([1-2][0-9])|(3[0-2])     {
                                        yylval = atoi(yytext); 
                                        return NUMBER;
                                    }

\n         { return NEWLINE; }
union      { return UNION; }
UNION      { return UNION; }
inter      { return INTER; }
INTER      { return INTER; }
comp       { return COMPL; }
COMP       { return COMPL; }
diff       { return DIFF; }
DIFF       { return DIFF; }


[[:space:]] ;

. fprintf(stderr, "Erreur lex: %s\n", yytext);

%%