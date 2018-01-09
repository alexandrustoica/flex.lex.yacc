%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char * string);
int symbols[100];
int valueOfSymbol(char symbol);
void updateSymbolWithValue(int value, char symbol);

%}

%union {
	int integer;
	char* text;
}

%start program

%token if_t else_t for_t read_t print_t range_t int_t string_t 
%token assign semicolon open_brackets close_brackets colon
%token open_special_brackets close_special_brackets
%token less greater less_or_equal greater_or_equal equal not_equal
%token plus minus division multiply
%token quote next

%token identifier
%token constant

%token <integer> INTEGER
%token <text> STRING 

%%

program 	 	: 
				| block program 
			 	;

block 		 	: declaration
			 	| statement
			 	;

statement		: assignment
				| control
				| io_statement
				;

assignment		: type identifier assign expression semicolon
				;

io_statement	: read_t open_brackets identifier close_brackets semicolon
				| print_t open_brackets expression close_brackets semicolon
				;

control			: conditional
				| loop
				;

conditional		: if_t open_brackets expression close_brackets 
				  open_special_brackets block close_special_brackets
				;

loop			: for_t open_brackets type identifier colon range close_brackets
				  open_special_brackets block close_special_brackets
				;

range			: identifier
				| range_t open_brackets constant next constant close_brackets
				;

declaration 	: type identifier assign expression
			 	| type identifier
			 	;

type 		 	: int_t
			  	| string_t
				;
 
expression 	 	: sign_atom
				| expression operation atom
				| open_brackets expression close_brackets
				;

sign_atom 		: atom
				| minus atom
				;

atom			: identifier
				| constant

operation		: low_operation
				| high_operation
				;

low_operation 	: plus
				| minus
				;

high_operation 	: division
				| multiply		
				| relation
				;

relation		: equal
				| not_equal
				| greater_or_equal
				| less_or_equal
				| greater
				| less
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
