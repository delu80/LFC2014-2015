
/*Location tracking example
	gnu.org
*/

%{
	#include<stdio.h>
	#include<math.h>
	int yylex(void);
	void yyerror(char const *);
%}

%token NUM
%left '-''+'
%left '*''/'
%nonassoc NEG
%right '^'

%error-verbose
%%



input:	/*empty*/
		| input line
		;

line:	'\n'
		| exp '\n'		{printf("%d\n",$1);}
		;

exp:	NUM						{ $$ = $1;}
		| exp '+' exp			{ $$ = $1+ $3;}
		| exp '-' exp			{ $$ = $1- $3;}
		| exp '*' exp			{ $$ = $1* $3;}
		| exp 					/*{
									if(!($1)){
										fprintf(stdout, "found zero as dividend\n returning zero as default");
									}
								}*/

				'/' exp			{ 	if($3){
										$$ = $1/$3;
									}
									else{
										$$ = 1;
										fprintf(stderr, "at line %d follows detail on columns--> %d.%d-%d.%d: division by zero\n returning 1 as default action\n ",@3.first_line, @3.first_line, @3.first_column, @3.last_line, @3.last_column);
									}
								}
		| '-' exp	%prec NEG	{ $$ = -$2;}
		| exp '^' exp			{ $$ = pow ($1,$3);}
		| '(' exp ')'			{ $$ = $2;}
		;

%%

int
main (void)
{
  yylloc.first_line = yylloc.last_line = 1;
  yylloc.first_column = yylloc.last_column = 0;
  return yyparse ();
}
