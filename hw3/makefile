all:	test

test:	test.l test.ypp
	bison -d test.ypp
	flex test.l
	g++ -c test.tab.cpp lex.yy.c -lfl
	g++  -std=c++0x main.cpp test.tab.o lex.yy.o -o output
	-rm test.tab.hpp test.tab.cpp lex.yy.c test.tab.o lex.yy.o
