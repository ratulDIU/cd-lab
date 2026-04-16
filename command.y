%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex(void);
void yyerror(const char *s);
%}

%union {
    int num;
    char *str;
}

%token PRINT SET TO ADD AND EXIT
%token <num> NUM
%token <str> ID

%%

lines:
    lines line
    | line
    ;

line:
    PRINT ID            { printf("printing>>>> %s\n", $2);free($2);}
    |SET ID TO NUM      {printf("%s = %d\n", $2, $4);free($2);}
    |ADD NUM AND NUM    {printf("Sum = %d\n", $2 + $4);}
    |EXIT               {printf("Exiting...\n");exit(0);}
    ;

%%

void yyerror(const char *s){
    printf("Error: %s\n", s);
}

int main(){
    printf("Enter commands:\n");
    yyparse();
    return 0;
}