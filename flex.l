%{
#include "flex.h"
%}

%%

"Int"								return INT;
"String" 							return STRING;
"print" 							return PRINT;
"read" 								return READ;
"if"								return IF;
"else"								return ELSE;
"range"								return RANGE;
"for"								return FOR;
"("		    						return START_BRACKETS;
")"		    						return END_BRACKETS;
"{"		    						return START_SPECIAL_BRACKETS;
"}"		    						return END_SPECIAL_BRACKETS;
"+"		    						return PLUS;
","         						return NEXT;
"-"		    						return MINUS;
"*"		    						return STAR;
"<="								return LESS_OR_EQUAL;
">="								return GREATER_OR_EQUAL;
"=="								return EQUAL;
"!="								return NON_EQUAL;
"=" 								return ASSIGN;
"<"	    							return LESS;
">"		    						return GREATER;
":"		    						return COLON;
"\""								return QUOTE;
";" 								return END_INSTRUCTION;
[a-zA-Z_]([0-9]|[a-zA-Z_]){0,259}  	return IDENTIFIER;
\"[a-zA-Z0-9]*\" 					return CONSTANT;
(\+|\-)?[0-9]+    					return CONSTANT;
[ \f\v\t\n]        					{/* ignore spaces && tabs */}
.		    						printf("Error!");

%%

int yywrap(void) {
	return 1;
}
