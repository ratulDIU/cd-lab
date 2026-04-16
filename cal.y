%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}


%union{
    int num;
}

%token <num> NUM
%left '+' '-'
%left '*' '/'
%type <num> expr
%%
lines:
    lines line
    | line
    ;

line:
    expr '\n' {printf("Result = %d\n", $1); }
    ;

expr:
    expr '+' expr   { $$ = $1 + $3 ;}
    |expr '-' expr  { $$ = $1 - $3 ;}
    |expr '*' expr  { $$ = $1 * $3 ;}
    |expr '/' expr  { $$ = $1 / $3 ;}
    //|expr '(' expr ')' { $$ = $1 * $3; }
    |'(' expr ')'   { $$ = $2 ;}
    |NUM            { $$ = $1 ;}

%%

void yyerror( const char *s){
    printf("Error = %s\n",s);
}

int main(){
    return yyparse();
}
    