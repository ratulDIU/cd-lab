%{
#include "problem2.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+"."[0-9]+   { yylval.num = atof(yytext); return NUM; }
[0-9]+            { yylval.num = atof(yytext); return NUM; }

[ \t]+            { }
\n                { return '\n'; }

.                 { return yytext[0]; }

%%

int yywrap(){
    return 1;
}