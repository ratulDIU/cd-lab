%{
#include "command.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"PRINT"        { return PRINT; }
"SET"          { return SET; }
"TO"           { return TO; }
"ADD"          { return ADD; }
"AND"          { return AND; }
"EXIT"         { return EXIT; }

[a-zA-Z][a-zA-Z0-9]*        {yylval.str = strdup(yytext);return ID;}
[0-9]+                      {yylval.num = atoi(yytext);return NUM;}
[ \t]+                      { }
\n                          { return '\n'; }
.                            { return yytext[0]; }

%%

int yywrap(){
    return 1;
}

%{
#include "problem4.tab.h"
#include<stdlib.h>
#include<string.h>
%}

%%

"print"		{return print;}
"set"		{return set; }
"to"		{return to; }
"add"		{return add; }
"and"		{return and; }
"exit"		{return exit; }

[a-zA-Z_] [a-zA-Z0-9_]*		{yylval.str=stdrup(yytext); return ID; }
[0-9]+				{yyval.num=atoi(yytext); return NUM; }

%%

int yywrap(){
	return 1;
}