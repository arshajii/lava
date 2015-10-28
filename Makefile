TARGET = lava
LIBS = -lm
CC = gcc
WARNINGS = -Wall -Wextra -Werror
CFLAGS = -std=c99 -march=native -O3 -flto -fstrict-aliasing $(WARNINGS)
LFLAGS = -march=native -O3 -flto

SRCDIR = src
OBJDIR = obj
INCDIR = include

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(wildcard $(SRCDIR)/*.c))
HEADERS = $(wildcard $(INCDIR)/*.h)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -I$(INCDIR) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(LFLAGS) $(OBJECTS) $(LIBS) -o $@

clean:
	-rm -f $(OBJDIR)/*.o
