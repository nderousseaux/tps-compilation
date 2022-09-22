%option noyywrap

prepro      include|define|undef|line|error|pragma
kw          asm|class|double|friend|new|register|struct|unsigned|auto|const|else|goto|operator|return|switch|virtual|break|continue|enum|if|overload|short|this|void|catch|default|extern|inline|private|signed|template|volatile|case|char|delete|do|float|for|int|long|protected|public|sizeof|static|typedef|union|while
any         [a-zA-Z_][a-zA-Z0-9_]*
comment     \/\/.*\n|\/\*.*?\*\/
string      \"[^"]*\"

%%
\<                  { printf("&lt;");}
\>                  { printf("&gt;");}
&                   { printf("&amp;");}
{kw}[ (\[{]         { printf("<span class=\"kw\">%s</span>", yytext);}
{comment}           { printf("<span class=\"comment\">%s</span>", yytext);}
{string}            { printf("<span class=\"str\">%s</span>", yytext);}

%%

int main(int argc , char **argv)
{
    
    yyin = fopen(argv[1], "r");
    printf("<html><body>\n<style>\n.kw { font-weight: bold; }\n.str { color: green; }\n.comment { color: red; }\n.prepro { color: purple; }\n</style><pre>\n");
    yylex();
    printf("</pre></body></html>");
    return 0;
}