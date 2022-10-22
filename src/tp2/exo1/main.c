#include <stdio.h>
extern int yyparse();

int main() {
    int r = yyparse();
    printf("-> %d\n", r);
    return r;
}