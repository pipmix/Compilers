

%{

	#include "test.tab.h"
	#include <stdio.h>
	#include "SymbolTable.h"
	
int yylineno = 0;

%}

%option noyywrap

%%

"+"		{ return ADD; }
"-"		{ return SUB; }
"*"		{ return MUL; }
"/"		{ return DIV; }
\n		{ ++yylineno; return 0; }
"("		{ return OP; }
")"		{ return CP; }
";"		{ return SEMI; }
"{"		{ return OB; }
"}"		{ return CB; }
"="		{ return EQL; }

"begin" 	{ return BEG; } 
"end" 		{ return END; } 

[0-9]+		{ 
			ylval->d = atof(yytext); 
			return NUMBER; 
		}
[a-zA-Z]+	{ 
			yylval.symbol = lookup(yytext);
			return NAME; 
		}

[ \t]		; // WHITESPACE

%%
