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

assignment		: identifier '=' expression ';'
				;

io_statement	: "read" '(' identifier ')' ';'
				| "print" '(' expression ')' ';'	
				;

control			: conditional
				| loop
				;

conditional		: "if" '(' expression ')' '{' block '}'
				;

loop			: "for" '(' type identifier ':' range ')' '{' block '}'
				;

range			: identifier
				| "range" '(' constant ':' constant ')'
				;

declaration 	: type identifier '=' expression
			 	| type identifier
			 	;

type 		 	: "Int"
			  	| "String"
				;

identifier 		: "0"
			 	;

constant 	 	: "1"
				| "\"" "1" "\""
			 	;
 
expression 	 	: sign_atom
				| expression operation atom
				| '(' expression ')'
				;

sign_atom 		: atom
				| '-' atom
				;

atom			: identifier
				| constant

operation		: low_operation
				| high_operation
				;

low_operation 	: '+'
				| '-'
				;

high_operation 	: '/'
				| '*'		
				| relation
				;

relation		: "=="
				| "!="
				| ">="
				| "<="
				| ">"
				| "<"
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
