%{
#include "problem3.tab.h"
#include <stdlib.h>
%}

%%

"&&"        { return AND; }
"||"        { return OR; }
"!"         { return NOT; }

[01]        { yylval.num = atoi(yytext); return BOOL; }

[ \t]+      { }
\n          { return '\n'; }

.           { return yytext[0]; }

%%

int yywrap(){
    return 1;
}