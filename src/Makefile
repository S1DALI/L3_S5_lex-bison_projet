# Makefile TP Flex et Bison
CC=gcc
CFLAGS=-Wall
LDFLAGS=-Wall -ll
EXEC=projet
ANLEX=$(EXEC)
#all: $(EXEC) clean 
$(EXEC): $(EXEC).o  $(ANLEX).yy.o
	$(CC) -o $@ $^ $(LDFLAGS)
$(EXEC).c $(EXEC).h: $(EXEC).y
	bison -d -o $(EXEC).c $(EXEC).y
$(ANLEX).yy.c: $(ANLEX).lex
	flex -o $(ANLEX).yy.c $(ANLEX).lex
#tree.o : tree.c tree.h
#	$(CC) -o tree.o -c tree.c $(CFLAGS)
$(EXEC).o: $(EXEC).c $(EXEC).h
	$(CC) -o $(EXEC).o -c $(EXEC).c $(CFLAGS)
$(ANLEX).yy.o: $(ANLEX).yy.c $(EXEC).h
	$(CC) -o $(ANLEX).yy.o -c $(ANLEX).yy.c $(CFLAGS)
clean:
	rm -f $(ANLEX).yy.* $(EXEC).[och]