%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(const char * msg);
%}

%token ENTIER
%token PLUS
%token MOINS
%token FOIS
%token DIV
%token OUV
%token FER
%token NEWLINE

%left PLUS MOINS
%left FOIS DIV
%left UMOINS

%start S

%%
S           : E NEWLINE                 { printf("= %d\n\n", $1); return 0; }
            ;

E           : E PLUS E                  { $$ = $1 + $3; }
            | E MOINS E                 { $$ = $1 - $3; }
            | E FOIS E                  { $$ = $1 * $3; }
            | OUV E FER                 { $$ = $2; }
            | ENTIER                    { $$ = $1; }
            | MOINS E %prec UMOINS      { $$ = -$2; }
            | E DIV E                   {
                                            if ($3 == 0) {
                                                yyerror("Division par 0");
                                                return 1;
                                            } else {
                                                $$ = $1 / $3;
                                            }
                                        }
            ;
%%

void yyerror(const char * msg)
{
    fprintf(stderr, "Erreur yacc : %s\n", msg);
}
