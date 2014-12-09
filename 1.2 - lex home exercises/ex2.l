/**


L = [A-Za-z_]

so the first part L is used to see if we have something before the string we want to match. 
This is pretty clear, such part can or not be there. We don't mind about it.

Let's proceed checking what is remaining, 
we have the begin of the string identified by the first quote 
that we find `\"` - we match it by escaping the quote.

So far so good, we are now in the string.
We have a grouping options `()` in which 
either we match a \char (e.g.. \n \t) inside the string which is provided by `\\.`  - this comprises the closed \"
or we match everything that is not equal to "\n" - so any char

Outside the grouping option  we match the end of the string.

This said, gg wp

**/
%%

[A-Za-z_]?\"(\\.|[^\\"])*\"			{
									printf("matched a string with the given specification\n");
									printf("%s\n", yytext);

									}

%%

int main(){
	yylex();
	printf("\n");
	return 0;
}
