#include <iostream>
#include "Stack.h"


int main() {


	Stack stack;

	stack.Push();

	stack.Top()->Insert("Sweany");
	stack.Top()->Insert("Fu");
	stack.Top()->Insert("Akl");
	stack.Top()->Insert("Fu"); // Duplicate entry cannot add

	stack.Push();

	stack.Top()->Insert("Byrant");
	stack.Top()->Insert("Dantu");
	stack.Top()->Insert("Fu"); // Can add since in a new scope

	SymbolTable* ram	=	stack.Top()->Search("Dantu");  // Find in top scope
	SymbolTable* phil	=	stack.Top()->Search("Sweany"); // Will traverse scope until entry is found
	SymbolTable* empty	=	stack.Top()->Search("Bryce"); // Will traverse all scopes and not find


	stack.Pop();
	stack.Top()->Insert("rob");
	stack.Top()->Insert("Sweany"); // Since we popped, sweany is in the currnt scope, this entered at line 12

    return 0;
}
