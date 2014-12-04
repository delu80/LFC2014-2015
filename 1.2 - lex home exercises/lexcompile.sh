lex $1.l
gcc -c -o $1.o lex.yy.c
gcc $1.o -ll -o $1
