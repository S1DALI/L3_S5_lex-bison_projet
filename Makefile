
OBJDIR = bin
OBJ = $(addprefix $(OBJDIR)/, $(patsubst %.c, %.o, $(wildcard * .c)))
CC = gcc
LDFLAGS = -Wall -ll
CFLAGS = -Wall
EXEC = tpcas

all : $(OBJDIR) tpcas

$(OBJDIR)/%.o : src/%.c src/%.h
    $(CC) -c $< -o $@ $(CFLAGS)

$(EXEC) : $(OBJ)
    $(CC) -o $@ $^ $(LDFLAGS)

clean :
    @rm -f $(EXEC) $(wildcard *.o)
    @rm -f $(OBJDIR)