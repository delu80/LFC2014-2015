
%%

-?[0-9]+		{	int k = atoi(yytext);
					printf("%d", k%7==0?k+3:k);
					}

[\-A-Za-z0-9]+		ECHO;

%%

int main(){
	yylex();
	printf("\n");
	return 0;
}
