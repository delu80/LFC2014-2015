%{
	#include <stdio.h>
	#include "y.tab.h"
	void yyerror(char const *);
%}


%%


int						{return INTEGER; }
bool 					{return BOOLEAN; }

[a-zA-z][a-zA-z]+		{yylval.symbolname = strdup(yytext); 
						return NAME;}
[ \t\n]					;
;						return SEMICOLON;
.						yyerror("unexpected char\n");
%%


void yyerror(char const *s){
	fprintf(stderr,"%s\n",s);

}

int yywrap(void) {
    return 1;
}
