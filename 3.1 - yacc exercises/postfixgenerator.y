//postfixgenerator
%{
	#include <stdio.h>
	int yylex (void);
	void yyerror(char const *);
	extern char * yytext;
	int line_num = 1;

%}
%token NUM
%left '+' '-'
%left '*' '/'
%left '^'
%nonassoc unary

%error-verbose

%%

input:		/*empty*/
			| input line
			;

line:		'\n'						{line_num++;}
			| exp '\n'					{printf("\n");}
			;

exp:		NUM							{printf("%d ", $1);}
			| exp '+' exp				{printf("+");}
			| exp '-' exp				{printf("-");}
			| exp '*' exp 				{printf("*");}
			| exp '/' exp				{printf("/");}
			| exp '^' exp				{printf("^");}
			| 'n' exp		%prec unary	{printf("n");}
			;

%%

void yyerror(char const * s){
  fprintf(stderr, "line %d: %s\n", line_num, s);
}
int main(){
	yyparse();
}