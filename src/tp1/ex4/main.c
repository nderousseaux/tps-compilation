#include "utils.h"
#include "tokens.h"

extern int yylex();
extern char* yytext;

int main(int argc , char **argv)
{
    //On initialise la table des symboles
    struct _table * table = init_table();
    
    int t;
    do{ //On parcourt le fichier
        t = yylex();
        printf("%d ", t);

        //On affiche la valeur lexicale si c'est une constante
        if (t == CONST_ENTIERE || t == CONST_FLOAT || t == CONST_CHAR || t == CONST_STRING)
            printf("%s ", yytext);

        //On affiche l'index dans la table des symboles si c'est un identificateur
        if (t == IDENTIFICATEUR)
        {           
            printf(
                "%d ",
                add_symbol(table, yytext)
            );
        }
        
    } while(t != 0);

    return 0;
}
