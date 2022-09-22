#include <stdio.h>
#include <stdlib.h>
#include "token.h"
extern int yylex();
extern struct in_addr yy_addr;
extern char yy_name [32];

void fatal(const char * msg){
	fprintf (stderr,  "%s\n", msg);
	exit(1);
}

int main()
{
	int t;
	t = yylex();
	while(t!=0){
		if(t==ENDOFLINE){
			t=yylex();
		}
		else if (t == IPADDR){
			t = yylex();
			if (t != NAME)
				fatal("Syntax error (1)");
			t = yylex();
			if (t != ENDOFLINE)
				fatal("Syntax error (2)");
			t = yylex();
		}
		else{
			fatal("Syntax error (3)");
		}
	}			
	return 0;
}
