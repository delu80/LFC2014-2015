%{
	int flag = 0;
%}

%%

"<name>"	flag = 1;
"</name>"	{printf("\n");flag=0;}

.			{if(flag){
				ECHO;
			}}

\n
%%
