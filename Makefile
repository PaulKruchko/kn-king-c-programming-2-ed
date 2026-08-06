# Build all discovered chapter solutions from the repository root.

BUILD_MAKEFILES := $(shell find ch??_* -type f -path '*/build/Makefile' -print 2>/dev/null | sort)
BUILD_DIRS      := $(patsubst %/Makefile,%,$(BUILD_MAKEFILES))

.DEFAULT_GOAL := all

.PHONY: all clean list help

all:
	@if [ -z "$(BUILD_DIRS)" ]; then \
		echo "No solution build directories found."; \
	else \
		set -e; \
		for dir in $(BUILD_DIRS); do \
			echo "==> Building $$dir"; \
			$(MAKE) --no-print-directory -C "$$dir" all; \
		done; \
	fi

clean:
	@if [ -z "$(BUILD_DIRS)" ]; then \
		echo "No solution build directories found."; \
	else \
		set -e; \
		for dir in $(BUILD_DIRS); do \
			echo "==> Cleaning $$dir"; \
			$(MAKE) --no-print-directory -C "$$dir" clean; \
		done; \
	fi

list:
	@if [ -z "$(BUILD_DIRS)" ]; then \
		echo "No solution build directories found."; \
	else \
		for dir in $(BUILD_DIRS); do echo "$$dir"; done; \
	fi

help:
	@echo "Targets:"
	@echo "  all    Build every discovered chapter solution (default)"
	@echo "  clean  Clean every discovered chapter solution"
	@echo "  list   List discovered solution build directories"
	@echo "  help   Show this help"
