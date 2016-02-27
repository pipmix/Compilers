

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

"begin" 	{ return BEG; } 
"end" 		{ return END; } 

[0-9]+		{ 
			printf("Saw an integer: %s\n", yytext);
			//yylval.value = atof(yytext);
			//yylval = atoi(yytext);
			yylval.argtype = "int";
			return NUMBER; 
		}
[a-zA-Z]+	{ 
			struct SymbolTable *sp = symbolLookup(yytext);
			yylval.symp = sp;
			return NAME; 
		}

[ \t]		; // WHITESPACE

%%
