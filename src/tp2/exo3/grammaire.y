%{
    #include <stdio.h>
    #include "tokens.h"
    #include "utils.h"
    extern int yylex();
    void yyerror(const char * error);
%}

%start liste
%token IDENT
%token OBRACE
%token CBRACE
%token ASSIGN
%token SEPARATEUR
%token NUMBER
%token NEWLINE
%token UNION
%token INTER
%token COMPL
%token DIFF


%%

liste               : %empty
                    | liste instruction NEWLINE
            
instruction         : IDENT ASSIGN expression                   {assign($3, $1);}
                    | IDENT                                     {printSet($1);}
                    
expression          : operande
                    | operande operateur2 operande              {$$ = operationSet($2, $1, $3);}
                    | operateur1 operande                       {$$ = complementSet($2);}
                    
operateur2          : UNION                                     {$$ = 0;}
                    | INTER                                     {$$ = 1;}
                    | DIFF                                      {$$ = 2;}

operateur1          : COMPL                                     

operande            : IDENT                                     {$$ = getSet($1);}
                    | ensemble                                  {$$ = $1;}

ensemble            : OBRACE CBRACE                             {$$ = 0;}
                    | OBRACE liste-elements CBRACE              {$$ = $2;}

liste-elements      : NUMBER                                    {$$ = createSet($1);}
                    | NUMBER SEPARATEUR liste-elements          {$$ = unionSet(createSet($1), $3);}
%%


void yyerror(const char * error)
{
    fprintf(stderr, "Erreur yacc: %s\n", error);
}
