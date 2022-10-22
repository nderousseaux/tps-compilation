#include <stdio.h>
extern int yyparse();

int main() {
    int r;

    //On boucle tant que yyparse() ne renvoie pas 0
    while ((r = yyparse()) != 0) {
        continue;
    }
    return r;
}