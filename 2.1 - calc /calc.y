/** calculator calc.y
 * origin source by Tom Niemann at epaperpress.com/lexandyacc
 * revision Lorenzo Massimo Gramola (2014)
 */

%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}

/*
 * we specify here the token used, in order for YACC TO create
 * the pieces of codes like '#DEFINE...' in the y.tab.h
 * further more we specify the precedence for the operators
 */

%token INTEGER VARIABLE
%left '+' '-'
%right '*' '/'

%{
    void yyerror(char *);
    int yylex(void);
    int sym[26]; //declaration for the symbol table
%}

%%

/**
 we change a little bit the program structure here
 grammar becomes more interesting
 */

program:
        program statement '\n'
        | 
        ;
statement:
        expr                      {printf("%d\n", $1);}
        | VARIABLE '=' expr       {sym[$1] = $3;}
        ;

expr:
        INTEGER
        | VARIABLE                {$$ = sym[$1];}
        | expr '+' expr           { $$ = $1 + $3; }
        | expr '-' expr           { $$ = $1 - $3; }
        | expr '*' expr           { $$ = $1 * $3; }
        | expr '/' expr           { $$ = $1 / $3; }
        | '(' expr ')'            {$$=$2;}
        ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
