#ifndef STACK_H
#define STACK_H

#include "SymbolTable.h"

	// This stack is implimented by linked list to meet the requirments of 
	// traversing scope and returning a pointer to symboltables not 
	// at the top of stack. 


class Stack{

public:
			Stack		();
			~Stack		();

	void		Push		();
	void		Pop		();
	SymbolTable*	Top		();

private:

	SymbolTable*	m_TopSymbolTable; 

};
#endif // STACK_H


