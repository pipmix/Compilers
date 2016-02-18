#include "Stack.h"

Stack::Stack() {
			m_TopSymbolTable = nullptr;
}

Stack::~Stack() {
			delete m_TopSymbolTable;
			m_TopSymbolTable = nullptr;
}
// This is just add a new node to a linked list
void Stack::Push() {

	if (m_TopSymbolTable == nullptr) m_TopSymbolTable = new SymbolTable;
	else {
			SymbolTable* temp = m_TopSymbolTable;
			m_TopSymbolTable = new SymbolTable;
			m_TopSymbolTable->Push(temp);
	}
	cout << "-------Push Stack----------" << endl;
}
// This is removing a node from a linked list
void Stack::Pop() {

	if (m_TopSymbolTable == nullptr) return;
	else if (m_TopSymbolTable->ReturnNext() == nullptr) {
			m_TopSymbolTable->Delete();
			m_TopSymbolTable = nullptr;
	}
	else {
			SymbolTable* temp = m_TopSymbolTable->ReturnNext();
			m_TopSymbolTable->Delete();
			m_TopSymbolTable = temp;
	}
	cout << "-------Pop Stack----------" << endl;
}
// This returns the top node of the linked list which would be the current scope
SymbolTable* Stack::Top() {
			return m_TopSymbolTable;
}
