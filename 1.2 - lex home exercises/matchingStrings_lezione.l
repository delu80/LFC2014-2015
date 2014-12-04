

%%

\"([^\"]|\\.)*\"			{
									printf("matchied a string with the given specification\n");
									printf("%s\n", yytext);

									}

%%

int main(){
	yylex();
	printf("\n");
	return 0;
}