%{

#include "test.tab.h"

%}

%%

"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
\n	{ return EOL; }
"("	{ return OP; }
")"	{ return CP; }
";"	{ return SEMI; }

"begin" { return BEG; } 
"end" 	{ return END; } 

[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]+    ; // STRING

[ \t]		; // WHITESPACE

%%
