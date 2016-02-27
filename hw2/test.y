
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <AST.h>

	int yylex(void);
	void yyerror(char const*);


%}

%union {

	struct AstNode * ast;
 	double number;
	int operator;
	char* str

}

%type <node> no



%token <number> NUMBER 
%token <str> NAME




%token EOL END BEG SEMI

%right EQL
%left SUB ADD
%left MUL DIV
%token CP OP


%type <AstNode> exp 






%%



exp
  : exp ADD exp           	{ $$ = newNode (Node_Add, $1, $3); }
  | exp SUB exp           	{ $$ = newNode (Node_Sub, $1, $3);}
  | exp MUL exp           	{ $$ = newNode (Node_Mul, $1, $3); }
  | exp DIV exp           	{ $$ = newNode (Node_Div, $1, $3); }
  | OP exp CP           	{ $$ = $2; }
  | SUB exp %prec UMINUS  	{ $$ = newNode (Node_Neg, $2, NULL); }
  | NUMBER                	{ $$ = newNode ($1); }
  | NAME                  	{ $$ = newNode ($1); }
  | NAME EQL exp          	{ $$ = newNode ($1, $3); }
  | NAME OP CP          	{ $$ = new_ast_function_node ($1, NULL); }
  | NAME OP exp_list CP 	{ $$ = new_ast_function_node ($1, $3); }
;




%%





void yyerror(char const *s){
	fprintf(stderr, "error: %s\n", s);
}