/** calculator calc.l
 * origin source by Tom Niemann at epaperpress.com/lexandyacc
 * revision Lorenzo Massimo Gramola (2014)
 */
%{
    #include <stdlib.h>
    #include "calc.h" //new respect to precedent example, we need this file for its definitions
    #include "y.tab.h" //take care of order of include, y.tab.h needs calc.h, if you swap the order you may encounter dependecies problems :S

    void yyerror(char *);
%}

%%

[a-z]           {
                    yylval.sIndex = *yytext - 'a';
                    return VARIABLE;
                }
0               {
                    yylval.iValue = atoi(yytext);
                    return INTEGER;
                }
[1-9][0-9]*     {
                    yylval.iValue = atoi(yytext);
                    return INTEGER;
                }

[-+()<>=*/;{}.]   { return *yytext; }

">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;
"for"           return FOR;
"to"            return TO;
"skip"          return SKIP;


[ \t\n]         ;/* skip whitespace */

.               yyerror("Unknown character");

%%

int yywrap(void) {
    return 1;
}