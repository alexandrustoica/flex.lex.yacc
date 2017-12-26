# flex.lex.yacc

Simple Scanner && Parser with lex and yacc.

#### Build LEX
```
$ lex flex.l
$ gcc flex.c lex.yy.c -o flex.out -Wall
$ ./flex.out < test.flex  /* for testing */
```
