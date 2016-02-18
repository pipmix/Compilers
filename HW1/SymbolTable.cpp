#include "SymbolTable.h"



SymbolTable::SymbolTable() {

	next = nullptr;


}
SymbolTable::~SymbolTable() {

}
// This function will traverse symboltables via linked list until found and 
// return address of symbol table as sweany showed in his example driver
SymbolTable* SymbolTable::Search(string str) {

	cout << "SEARCH: ";

	if (find(this->nodes.begin(), this->nodes.end(), str) != this->nodes.end()) {

			cout << str << " was found " << "returning current Symbol Table" << endl;
			return this;
	}
	else {

		if (next == nullptr) {
			cout << str << " was not found at any scope " << endl;
			return nullptr;
		}
		else {
			cout << str << " was not found in this symbol table, going up a scope ... " << endl;
			next->Search(str);
		}
	}
}


// The search is implimented with a vector, using a bst would require
// a randomly generated node value as there is no value assicated with a string
void SymbolTable::Insert(string str) {

	cout << "INSERT: ";

	if (std::find(nodes.begin(), nodes.end(), str) != nodes.end()){

		cout << "Failure, " << str << " was already in the top symbol table and could not be added " << endl;
	}

	else {
		nodes.push_back(str);
		cout << "Success, added " << str << " into top Symbol Table" << endl;
	}
}
// Will add on to the linked list
void SymbolTable::Push(SymbolTable* st) {

	next = st;
}
// Returns the next st on the linked list
SymbolTable* SymbolTable::ReturnNext(){

	return next;
}

void SymbolTable::Delete() {
	//Does not do anything, will be dynamiclly allocated bst when implimented
	return;
}
