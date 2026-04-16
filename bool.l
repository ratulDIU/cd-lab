
%{
#include "bool.tab.h"
#include <stdlib.h>
%}

%%

"AND"   {return AND; }
"OR"    {return OR; }
"NOT"   {return NOT; }

[01]    {yylval.num=atoi(yytext);return BOOL;}

[ \t ]  {/*ignore*/}
[ \n ]   {return '\n'; }
.       {return yytext[0]; }

%%

 int yywrap(){
    return 1;
 }


%{

#include "problem2.tab.h"
#include<stdlib.h>

%}

%%

&&		{return AND ;}
||		{return OR ;}
!		{return NOT;}

[01]		{yylval.num=atoi(yytext);return BOOL; }
[\t]		{/*ignore*/}
[\n]		{return '\n'; }
.		{return yytext[0]; }


%%

int yywrap(){
	return 1;
}