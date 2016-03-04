#include <iostream>
using namespace std;

extern int yyparse();
extern void yyerror(const char *);
extern int yylex();


int main(){

	int result = yyparse();
	return 0;


}
