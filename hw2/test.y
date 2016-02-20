

//-------------------------------------------------------
%{
#  include <stdio.h>
%}
//-------------------------------------------------------


%token NUMBER ADD SUB MUL DIV ABS OP CP EOL END BEG SEMI


//-------------------------------------------------------
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


//-------------------------------------------------------



main(){

  yyparse();
}

yyerror(char *s){
  fprintf(stderr, "error: %s\n", s);
}


//-------------------------------------------------------