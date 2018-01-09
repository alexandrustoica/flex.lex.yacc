%{
#include "y.tab.h"
%}

%%

"Int"								return int_t;
"String" 							return string_t;
"print" 							return print_t;
"read" 								return read_t;
"if"								return if_t;
"else"								return else_t;
"range"								return range_t;
"for"								return for_t;
"("		    						return open_brackets;
")"		    						return close_brackets;
"{"		    						return open_special_brackets;
"}"		    						return close_special_brackets;
"+"		    						return plus;
","         						return next;
"-"		    						return minus;
"*"		    						return multiply;
"<="								return less_or_equal;
">="								return greater_or_equal;
"=="								return equal;
"!="								return not_equal;
"=" 								return assign;
"<"	    							return less;
">"		    						return greater;
":"		    						return colon;
"\""								return quote;
";" 								return semicolon;
[a-zA-Z_]([0-9]|[a-zA-Z_]){0,259}  	return identifier;
\"[a-zA-Z0-9]*\" 					return constant;
(\+|\-)?[0-9]+    					return constant;
[ \f\v\t\n]        					{/* ignore spaces && tabs */}
.		    						printf("Error!");

%%

int yywrap(void) {
	return 1;
}
