%option noyywrap
%{
    int i=0;
%}

blanc   [ ]
carac   [^ \n\t\b]
%%
{blanc}+    {;}
{carac}+    {i++;}
"\n"        {;}
"\t"        {;}
"\b"        {;}
%%
int main(int argc , char **argv)
{
    yyin = fopen(argv[1], "r");
    yylex();
    printf("      %d %s\n", i, argv[1]);
    return 0;
}