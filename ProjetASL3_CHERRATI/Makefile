# Makefile projet analyse

CC=gcc
CFLAGS=-Wall
LDFLAGS=-Wall -lfl
EXEC=tpcas

SRC_DIR=src
OBJ_DIR=obj
BIN_DIR=bin

SRC=$(SRC_DIR)/parser.h $(wildcard $(SRC_DIR)/*.h)
OBJ=$(OBJ_DIR)/lexer.o $(OBJ_DIR)/parser.o \
		$(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

$(BIN_DIR)/$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(SRC)
	$(CC) -c -o $@ $< $(CFLAGS)

$(SRC_DIR)/lexer.c: $(SRC_DIR)/lexer.lex
	flex -o $@ $<

$(SRC_DIR)/parser.c $(SRC_DIR)/parser.h: $(SRC_DIR)/parser.y
	bison -d -o $(SRC_DIR)/parser.c $<

clean:
	rm -f $(SRC_DIR)/lexer.c $(SRC_DIR)/parser.[ch] $(SRC_DIR)/parser.output $(OBJ_DIR)/*.o $(BIN_DIR)/$(EXEC)