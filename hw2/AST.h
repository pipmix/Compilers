

enum NodeType{ Node_Add, Node_Sub, Node_Mul, Node_Div, Node_Eql, Node_Number, Node_Neg, Node_Symbol, Node_OP, Node_CP };

// Instead of making multiple types of nodes for the AST, the enum determines the type and stores the relevent information.

struct AstNode {

	int nodetype;
	struct AstNode* leftNode;
	struct AstNode* rightNode;
	double value ;
	char* name;

	AstNode(int n, AstNode* l, AstNode* r){
		nodetype = n;
		leftNode = l;
		rightNode = r;

	}

	AstNode(double val){
		nodetype = Node_Number;
		value = val;
		leftNode = rightNode = NULL;
	}

	AstNode(char* str, double val){
		nodetype = Node_Symbol;
		name = str;
		value = val;
		leftNode = rightNode = NULL;
	}

	AstNode(char* str){
		nodetype = Node_Symbol;
		name = str;
		value = NULL;
		leftNode = rightNode = NULL;
	}

};

