/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     if_t = 258,
     else_t = 259,
     for_t = 260,
     read_t = 261,
     print_t = 262,
     range_t = 263,
     int_t = 264,
     string_t = 265,
     assign = 266,
     semicolon = 267,
     open_brackets = 268,
     close_brackets = 269,
     colon = 270,
     open_special_brackets = 271,
     close_special_brackets = 272,
     less = 273,
     greater = 274,
     less_or_equal = 275,
     greater_or_equal = 276,
     equal = 277,
     not_equal = 278,
     plus = 279,
     minus = 280,
     division = 281,
     multiply = 282,
     quote = 283,
     next = 284,
     identifier = 285,
     constant = 286,
     INTEGER = 287,
     STRING = 288
   };
#endif
/* Tokens.  */
#define if_t 258
#define else_t 259
#define for_t 260
#define read_t 261
#define print_t 262
#define range_t 263
#define int_t 264
#define string_t 265
#define assign 266
#define semicolon 267
#define open_brackets 268
#define close_brackets 269
#define colon 270
#define open_special_brackets 271
#define close_special_brackets 272
#define less 273
#define greater 274
#define less_or_equal 275
#define greater_or_equal 276
#define equal 277
#define not_equal 278
#define plus 279
#define minus 280
#define division 281
#define multiply 282
#define quote 283
#define next 284
#define identifier 285
#define constant 286
#define INTEGER 287
#define STRING 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 12 "flex.y"
{
	int integer;
	char* text;
}
/* Line 1529 of yacc.c.  */
#line 120 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

