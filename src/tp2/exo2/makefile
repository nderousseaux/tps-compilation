OBJDIR		:= ../../../out

all: $(OBJDIR)/main
	$(OBJDIR)/main

$(OBJDIR)/main: $(OBJDIR)/grammaire.tab.o $(OBJDIR)/syntaxe.yy.c main.c
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

$(OBJDIR)/grammaire.tab.c: grammaire.y
	bison -v -d grammaire.y -o $(OBJDIR)/grammaire.tab.c

$(OBJDIR)/syntaxe.yy.c: syntaxe.lex $(OBJDIR)/grammaire.tab.h
	flex -o $(OBJDIR)/syntaxe.yy.c syntaxe.lex

clean:
	rm -f $(OBJDIR)/*