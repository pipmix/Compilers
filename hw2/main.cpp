#include <iostream>
using namespace std;

extern "C"{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}
extern int yylineno;

int main(){

	int result = yyparse();
	cout << yylineno;
	if (result) cout << "Valid" << endl;
	else
	cout << "Invalid" << endl;

	return result;


}
