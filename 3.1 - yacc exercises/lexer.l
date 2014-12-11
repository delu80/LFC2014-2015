%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
    extern int line_num;
%}

%%
[0-9]+      {
                yylval = atoi(yytext);
                return NUM;
            }

[-+^/*]      { return *yytext; }
\n 				{ line_num++; return *yytext;}
[ \t]       ;       /* skip whitespace */

.           yyerror("Unknown character");

%%

int yywrap(void) {
    return 1;
}