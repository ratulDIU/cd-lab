%{
#include "problem4.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"print"        { return PRINT; }
"subtract"     { return SUB; }
"from"         { return FROM; }
"set"          { return SET; }
"to"           { return TO; }
"add"          { return ADD; }
"and"          { return AND; }
"if"           { return IF; }
"then"         { return THEN; }
"exit"         { return EXIT; }

[a-zA-Z]+      { yylval.str = strdup(yytext); return ID; }
[0-9]+         { yylval.num = atoi(yytext); return NUM; }
">"            { return '>'; }
[ \t]+         { }
\n             { return '\n'; }

.              { return yytext[0]; }

%%

int yywrap(){
    return 1;
}