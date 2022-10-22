#include <stdio.h>

#include "utils.h"
#include "tokens.h"

extern int yyparse();
extern int yylval;
// extern struct order_t * order;

int main() {
    createList();

    int r;
    do{ //On parcourt le fichier
        r = yyparse();
    } while(r != 0);
    return r;
}