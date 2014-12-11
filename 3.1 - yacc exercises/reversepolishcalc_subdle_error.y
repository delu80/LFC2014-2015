/* Reverse poilish notation calculator*/
%{

#include <stdio.h>	
#include <math.h>
int yylex (void);
void yyerror(char const *);

%}
//%require "3.0.2"
%token NUM

%%

input:		/*empty*/
			| input line
			;

line:		'\n'
			| exp '\n'			{printf ("%d\n", $1);}
			;

exp:		NUM					{ printf("%s\n",$1);}	//ERROR IS HERE - gosh
			| exp exp '+'		{$$ = $1+$2;}
			| exp exp '-'		{$$ = $1-$2;}
			| exp exp '*'		{$$ = $1*$2;}
			| exp exp '/'		{$$ = $1/$2;}
			| exp exp '^'		{$$ = pow($1,$2);}
			| exp 'n'			{$$ = -$1;}
			;

%%

int main(void){
	return yyparse();
}

void yyerror(char const * s){
	fprintf(stderr, "%s\n",s);
}