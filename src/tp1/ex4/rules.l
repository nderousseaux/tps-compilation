%option noyywrap

%{
#include "tokens.h"
%}

comment     \/\/.*\n|\/\*.*?\*\/
id          [a-zA-Z_][a-zA-Z0-9_]*

%%
cin                             { return CIN; }
const                           { return CONST; }
cout                            { return COUT; }
else                            { return ELSE; }
if                              { return IF; }
typedef                         { return TYPEDEF; }
while                           { return WHILE; }
-                               { return MOINS; }
\*                              { return MULT; }
\/                              { return DIV; }
%                               { return MOD; }
!                               { return NOT; }
&&                              { return OR; }
\|\|                            { return AND; }
\<                              { return INF; }
\<=                             { return INFEG; }
>                               { return SUP; }
>=                              { return SUPEG; }
==                              { return EGAL; }
!=                              { return DIFF; }
=                               { return AFFECT; }
«                               { return CHEVRON_OUVRANT; }
»                               { return CHEVRON_FERMANT; }
&                               { return ET; }
\|                              { return OU; }
\(                              { return PARENTHESE_OUVRANTE; }
\)                              { return PARENTHESE_FERMANTE; }
\{                              { return ACCOLADE_OUVRANTE; }
\}                              { return ACCOLADE_FERMANTE; }
\[                              { return CROCHET_OUVRANT; }
\]                              { return CROCHET_FERMANT; }
,                               { return VIRGULE; }
'                               { return APPOSTROPHE; }
;                               { return POINT_VIRGULE; }
\+                              { return PLUS; }

\"|'[^"]\"|'                    { return CONST_CHAR; }
[0-9]*\.[0-9]+                  { return CONST_FLOAT; }
[0-9]+                          { return CONST_ENTIERE; }
\"[^"]*\"                       { return CONST_STRING; }

{id}                            { return IDENTIFICATEUR; }

{comment}                       { }
[ \t\r\n]+                      { }
%%