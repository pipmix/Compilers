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
"**"		return EX;
">"		return GT;
"<"		return LT;
[ \t\n]		; 


"main() : void"	return FUNCMAIN;

"begin"		return BEG;
"end"		return END;
"output"	return OUTP;
"if"		return IFSTATE;
"do"		return DOSTATE;
"continue"	return CONTINUESTATE;

"int"		return VARINT;
"string"	return VARSTR;

"printi"	return FUNCPRINTI;
"prints"	return FUNCPRINTS;

"printLine"	return FUNCPRINTLINE;
"pushi"		return FUNCPUSHI;
"printInt"	return FUNCPRINTINT;
"printString"	return FUNCPRINTSTRING;

".lt."		return DOTLT;
".eq."		return DOTEQ;
".neq."		return DOTNEQ;
".ge."		return DOTGE;



[0-9]+		{ 	yylval.value = atoi(yytext);
			return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { 	yylval.str = strdup(yytext);
			return NAME; }

%%