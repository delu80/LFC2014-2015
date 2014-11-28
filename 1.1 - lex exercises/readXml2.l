%start name

%%

\<name\>	BEGIN name;
\<\/name\>	{BEGIN 0; printf("\n");}


<name>.				ECHO;
			
\n
.

%%
