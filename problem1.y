%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token IF ELSE WHILE INT RETURN
%token <str> ID

%%

input:
    input token
    | 
    ;

token:
      IF      { printf("Keyword: if\n"); }
    | ELSE    { printf("Keyword: else\n"); }
    | WHILE   { printf("Keyword: while\n"); }
    | INT     { printf("Keyword: int\n"); }
    | RETURN  { printf("Keyword: return\n"); }
    | ID      { printf("Identifier: %s\n", $1); free($1); }
    ;

%%
void yyerror(const char *s){
    printf("Error: %s\n", s);
}
int main(){
    printf("Enter words:\n");
    yyparse();
    return 0;
}