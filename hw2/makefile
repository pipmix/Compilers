all:	test

test:	test.l test.y
	bison -d test.y
	flex test.l
	gcc test.tab.c lex.yy.c -lfl -o me
	-rm test.tab.h test.tab.c lex.yy.c
