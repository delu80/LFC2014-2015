%{
	#include<stdio.h>
	#include<stdlib.h>
    #include "y.tab.h"
	//extern YYLTYPE yylloc;
    void yyerror(char const *);
%}

%%
[0-9]+		{  	yylloc.first_line = yylloc.last_line;
  				yylloc.first_column = yylloc.last_column;
			    yylval = atoi(yytext);
			    yylloc.last_column+=yyleng;
			    return NUM;
			}

[ \t]		{    ++yylloc.last_column;}

[-+/*^]		{	yylloc.last_column++;
				return *yytext;
			}
\n 			{	
				yylloc.last_line++;
				yylloc.last_column = 0;
				return *yytext;
			}
.			{
				yylloc.last_column++;
				ECHO;
				yyerror("unknown char");
			}
%%

int yywrap(void){
	return 1;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}