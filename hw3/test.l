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
"%"		return MOD;
">"		return GT;
"<"		return LT;
"++++"		return COMMA;
["]		return QUOTE;
[ \t,]		; 
[\n]		return NEWLINE;





"main() : void"	return FUNCMAIN;


"else"		return ELSESTATE;
"begin"		return BEG;
"end"		return END;
"output"	return OUTP;
"if"		return IFSTATE;
"do"		return DOSTATE;
"continue"	return CONTINUESTATE;

"int"		return VARINT;
"string"	return VARSTRING;
"char"		return VARCHAR;
"long"		return VARLONG;
"enum"		return VARENUM;


"printi"	return FUNCPRINTI;
"prints"	return FUNCPRINTS;

"printLine()"	return FUNCPRINTLINE;
"pushi"		return FUNCPUSHI;
"printInt"	return FUNCPRINTINT;
"printString"	return FUNCPRINTSTRING;

".lt."		return DOTLT;
".eq."		return DOTEQ;
".neq."		return DOTNEQ;
".ge."		return DOTGE;

"and"		return ANDAND;
"or"		return OROR;

\"(\\.|[^\\"])*\" {
			yylval.str = strdup(yytext);		
			return STRINGTEXT;
		}




[0-9]+		{ 	yylval.value = atoi(yytext);
			return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { 	yylval.str = strdup(yytext);
			return NAME; }

%%