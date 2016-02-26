all:	test

test:	test.l test.y
	bison -d test.y
	flex test.l
	gcc -c test.tab.c lex.yy.c -lfl
	g++ main.cpp test.tab.o lex.yy.o -o me
	-rm test.tab.h test.tab.c lex.yy.c test.tab.o lex.yy.o
	./me < input.txt

