%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}


%union{
    int num;
}

%token AND OR NOT
%token <num> BOOL

%left AND
%left OR
%left NOT
%type <num> expr

%%

lines:
     lines line
     |line
     ;

line:
    expr '\n'            {printf("Result = %d\n" ,$1);}
    ;
    expr:
    expr AND expr       {$$ = $1 && $3; }
    |expr OR expr        {$$ = $1 || $3; }
    |NOT expr            {$$ = !$2; }
    |'(' expr ')'        {$$ = $2; }
    |BOOL                { $$ = $1; }
    ;

%%

void yyerror(const char *s){
    printf("Error = %s\n", s);
}

int main(){
    printf(" Enter expression :\n" );
    yyparse();
    return 0;
}
