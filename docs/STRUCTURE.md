# Repository Structure

## Chapter directories

Top-level chapter directories follow `chNN_lowercase_title`, using the book's official chapter numbering and titles. Chapter 1 is introductory and contains no exercise scaffold, so this repository begins with Chapter 2.

## Item directories

Add each item directly beneath its chapter directory:

| Item type | Naming pattern | Example |
| --- | --- | --- |
| Worked example | `exampleNN_II_short_name` | `example02_01_printing_a_pun` |
| Exercise | `exNN_II_short_name` | `ex02_01_identify_directives` |
| Programming project | `ppNN_II_short_name` | `pp02_01_checkmark` |

`NN` is the two-digit chapter number and `II` is the two-digit item number. Use lowercase snake case for the short name.

## Per-item layout

Each compilable item contains:

- `src/` for `.c` and `.h` files
- `build/Makefile` for item-specific configuration

The shared rules in `mk/solution.mk` keep compiled output in `build/`, matching the out-of-source pattern used in the companion K&R repository while avoiding duplicated Make rules.

## Starting a new item

From the repository root, copy the template and rename the resulting directory:

```bash
cp -R templates/solution ch02_c_fundamentals/pp02_01_checkmark
```

Then edit:

1. `src/main.c`
2. `build/Makefile` (`TARGET`, `SOURCES`, `CSTD`, and optionally `LDLIBS`)

For multi-file programs, list each source file by name:

```make
TARGET  = inventory.out
SOURCES = main.c inventory.c
CSTD    = c99

include ../../../mk/solution.mk
```

Build it without placing generated files in `src/`:

```bash
make -C ch02_c_fundamentals/pp02_01_checkmark/build
```

## Source attribution

Prefer a short source-file comment that records the book edition, chapter, and item number. Do not reproduce the complete exercise or programming-project text. Clearly mark any code adapted from a separately licensed source and preserve its required notice.
