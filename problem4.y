%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int yylex(void);
void yyerror(const char *s);

int vars[26];
%}

%union {
    int num;
    char *str;
}

%token PRINT SUB FROM SET TO ADD AND IF THEN EXIT
%token <num> NUM
%token <str> ID

%%

lines:
    lines line
    | line
    ;

line:
    PRINT ID '\n'           { printf("%s\n", $2); free($2); }
    | ADD NUM AND NUM '\n'  { printf("Sum = %d\n", $2 + $4); }
    | SUB NUM FROM NUM '\n' { printf("Result = %d\n", $4 - $2); }
    | SET ID TO NUM '\n'    {vars[$2[0]-'a'] = $4;printf("%s = %d\n", $2, $4);free($2);}
    | IF ID '>' NUM THEN PRINT ID '\n'
        {
            if(vars[$2[0]-'a'] > $4)printf("%s\n", $7);free($2);free($7);
        }

    | EXIT '\n'
        { exit(0); }
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