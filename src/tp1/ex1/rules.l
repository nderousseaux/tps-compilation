%option noyywrap

VOYELLES [aeiouyAEIOUY]
ALL [a-zA-Z]

%%
{VOYELLES}+ printf("av%s",yytext);
%%
