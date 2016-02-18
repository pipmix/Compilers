#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

#define nullptr NULL

class SymbolTable{


public:
			SymbolTable		();
			~SymbolTable		();

	SymbolTable*	Search			(string str);

	void		Insert			(string str);
	void		Push			(SymbolTable* st);
	void		Delete			();
	SymbolTable*	ReturnNext		();

private:

	vector<string> nodes;
	SymbolTable* next;

};

#endif // SYMBOLTABLE_H
