
%{
	#include <stdio.h>
	#include "SymbolTable.h"

	#define YYSTYPE double
	#include <math.h>



	int yylex(void);
	void yyerror(char const*);

%}

%union {
	char* argtype;
	struct SymbolTable* symp;
}



%token <argtype> NUMBER 
%token <symp> NAME
%type <argtype> expression

//%token NUMBER NAME

%token EOL END BEG SEMI

%left SUB ADD
%left MUL DIV
%token CP OP
%token CB OB





%%



addsub: muldiv
| addsub ADD muldiv { $$ = $1 + $3; printf("%d\n", $$);}
| addsub SUB muldiv { $$ = $1 - $3; printf("%d\n", $$);}
;

muldiv: term
| muldiv MUL term { $$ = $1 * $3; printf("%d\n", $$);}
| muldiv DIV term { $$ = $1 / $3; printf("%d\n", $$);}
;

term: NUMBER { $$ = $1; }
;



%%





void yyerror(char const *s){
	fprintf(stderr, "error: %s\n", s);
}