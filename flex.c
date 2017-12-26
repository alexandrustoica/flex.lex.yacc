#include "flex.h"
#include <stdio.h>

extern int yylex();
extern int yylineno;
extern char * yytext;

int next_token(int token) {
    if (token) {
        printf("%d %s\n", token, yytext);
        return next_token(yylex());
    }
    return 0;
}

int main(void) {
    return next_token(yylex());
}