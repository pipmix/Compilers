%{
	#include "test.tab.hpp"
%}

%option noyywrap

%%

"+"		return ADD;
"-"		return SUB; 
"*"		return MUL;
"/"		return DIV;	
"("		return OP;
")"		return CP;
";"		return SEMI;
"="		return EQL;
[ \t\n]		; 


[0-9]+		{ 	yylval.value = atoi(yytext);
			return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { 	yylval.str = strdup(yytext);
			return NAME; }

"begin" 	return BEG;
"end"		return END;
"print"		return PRINT;
"output"	return OUTPUT;

%%