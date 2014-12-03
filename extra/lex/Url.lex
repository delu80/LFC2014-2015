method (ftp|http[s]?)

sub_domain ([a-zA-Z0-9_-]+[\.]?)

page ([a-zA-Z0-9\.\%\-\_\(\)\:\#\*]+[\/]?)

var_sub (&amp;|[a-zA-Z0-9\:\.\%\-\_\(\)\=\*\#])+

var {var_sub}={var_sub}

%%


{method}:\/\/{sub_domain}+((\/)?|\/{page}*)?(\?{var}(\&{var})*[\&]?)? {printf("%s\n", yytext);}

\n          |
.           ;
%%

int main(){
    yylex();
    return 0;
}
