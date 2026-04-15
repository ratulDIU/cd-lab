%{
#include "problem1.tab.h"
#include <string.h>
%}

%%

"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"int"       { return INT; }
"return"    { return RETURN; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext);return ID;}
[ \t\n]+    { }
.           { }

%%

int yywrap(){
    return 1;
}