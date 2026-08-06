# Shared GNU Make rules for one worked example, exercise, or project.
# The including build/Makefile defines TARGET, SOURCES, and optionally CSTD.

CC       = gcc
CSTD    ?= c99
WARNINGS = -Wall -Wextra -Wpedantic
CFLAGS   = -g -O0 $(WARNINGS) -std=$(CSTD)
DEPFLAGS = -MMD -MP

SRC_DIR ?= ../src
VPATH    = $(SRC_DIR)

TARGET  ?= solution.out
SOURCES ?= main.c
OBJECTS  = $(SOURCES:.c=.o)
DEPS     = $(OBJECTS:.o=.d)

.DEFAULT_GOAL := all

.PHONY: all run debug clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET) $(ARGS)

debug: $(TARGET)
	gdb --args ./$(TARGET) $(ARGS)

clean:
	$(RM) $(TARGET) $(OBJECTS) $(DEPS)

-include $(DEPS)
