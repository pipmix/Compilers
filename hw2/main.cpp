#include <iostream>
using namespace std;

extern "C"{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}


int main(){

	int result = yyparse();
	if (result) cout << "Valid" << endl;
	else
	cout << "Invalid" << endl;

	return result;


}
