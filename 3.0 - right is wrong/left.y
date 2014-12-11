%{
	#include<stdio.h>
	int yylex();
	void yyerror(char const *);
	int n_dec = 0;
%}

%union{
	char * symbolname;
};

%token BOOLEAN INTEGER NAME SEMICOLON
%type<symbolname> NAME
%error-verbose

%%


dec_list: 	/*empty*/
			| dec_list dec
			;
dec:		type NAME SEMICOLON  {printf("variable name: %s\n", $2);n_dec++;}
			;

type:		BOOLEAN			
			| INTEGER
			;

%%

int main(){
	
	yyparse();
	printf("declaration found: %d\n", n_dec);
}