%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char * string);
int symbols[100];
int valueOfSymbol(char symbol);
void updateSymbolWithValue(int value, char symbol);

%}

%union {int number; char id;}
%start program

%token print
%token exit_command

%token <number> constant
%token <id> identifier

%type <number> program atom
%type <id> assignment

%%

program		: program print atom ';'	{printf("%d\n", $3);} 
			| assignment ';'			{;}
			| print atom ';'			{printf("%d\n", $2);}
			| exit_command ';'			{exit(0);}
			;

assignment	: identifier '=' constant	{updateSymbolWithValue($3, $1);}
			;

atom 		: identifier				{$$ = valueOfSymbol($1);}
			| constant					{$$ = $1;}
			;

%%

int getSymbolIndex(char symbol) {
	return (islower(symbol))?
		symbol - 'a' + 26 :
		symbol - 'A';
}


int valueOfSymbol(char symbol) {
	return symbols[getSymbolIndex(symbol)];
}

void updateSymbolWithValue(int value, char symbol) {
	symbols[getSymbolIndex(symbol)] = value;
}

void yyerror(char * string) {
	printf("%s\n", string);
}

int main(void) {
	for(int index = 0; index < 100; index++) {
		symbols[index] = 0;	
	}
	return yyparse();
}
