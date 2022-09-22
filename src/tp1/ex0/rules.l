%option noyywrap

%{
#include <arpa/inet.h>
#include "token.h"

struct in_addr yy_addr;
char yy_name [32];
%}

CHAMP (0|[1-9][0-9]*)
%%
\#.*\n return ENDOFLINE;
{CHAMP}\.{CHAMP}\.{CHAMP}\.{CHAMP} {
	if (inet_pton (AF_INET, yytext, &yy_addr) != 1)
		return LEXERROR;
	return IPADDR;
}
[a-zA-Z][a-zA-Z0-9]* {
	if (yyleng > 31)
		return LEXERROR;
	strcpy(yy_name, yytext);
 	return NAME;
 }
\"([^\"]|\\.)+\" {
	if (yyleng > 31)
		return LEXERROR;
	strcpy(yy_name, yytext);
 	return NAME;
 }
\n return ENDOFLINE;
[[:space:]] ;
. return LEXERROR;
%%
