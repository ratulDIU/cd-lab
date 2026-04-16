%{
    #include "cal.tab.h"
    #include<stdlib.h>
%}

%%

[0-9]+      {yylval.num=atoi(yytext); return NUM;}
[\t]        {/*ignore*/}
[\n]        {return '\n';}
.           {return yytext[0];}

%%


int yywrap(){
    return 1;
}
