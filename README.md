# K. N. King — C Programming: A Modern Approach, 2nd Edition

This repository is my self-directed study of K. N. King's *C Programming: A Modern Approach*, Second Edition. It will contain my original solutions to the book's exercises and programming projects, along with selected worked examples that I implement while learning.

The organization combines the chapter-oriented layout of [williamgherman/c-solutions](https://github.com/williamgherman/c-solutions) with the per-solution `src/` and `build/` separation used in my [K&R study repository](https://github.com/PaulKruchko/KnR-C-Programming-2nd-Ed).

## Repository organization

Each book chapter has a top-level directory. Individual items are named by type:

- `example02_01_short_name/` — a worked example from Chapter 2
- `ex02_01_short_name/` — Exercise 1 from Chapter 2
- `pp02_01_short_name/` — Programming Project 1 from Chapter 2

Every compilable item keeps source and generated files separate:

- `src/` contains C source and header files.
- `build/Makefile` contains the item-specific GNU Make configuration.
- Object files, dependency files, and executables remain under `build/` and are ignored by Git.

See [docs/STRUCTURE.md](docs/STRUCTURE.md) for the full convention and a reusable starter template.

## Prerequisites

A Linux or other POSIX-like development environment with:

- GCC
- GNU Make
- GDB (optional, for debugging)

On Ubuntu:

```bash
sudo apt install build-essential gdb
```

## Building

Build one solution from the repository root:

```bash
make -C ch02_c_fundamentals/ex02_01_short_name/build
```

Or enter its build directory:

```bash
cd ch02_c_fundamentals/ex02_01_short_name/build
make
./solution.out
make clean
```

The top-level Makefile discovers every chapter item containing a `build/Makefile`:

```bash
make          # build every solution
make list     # list discovered build directories
make clean    # remove every generated build artifact
```

Each solution defaults to C99. Set `CSTD = c89` in its `build/Makefile` when an item is specifically intended for C89, or override it temporarily:

```bash
make -C path/to/build CSTD=c89
```

## Academic and copyright note

This is an independent learning repository, not an official solution manual. The book and its exercise text remain the property of their respective copyright holders. Repository notes should identify items by chapter and number without reproducing full problem statements. The MIT License applies only to my original code, documentation, and build tooling committed here.

## References

- [Official book site and table of contents](https://knking.com/books/c2/)
- [Official example programs](https://knking.com/books/c2/programs/index.html)
- [K&R C Programming, 2nd Edition — my companion study repository](https://github.com/PaulKruchko/KnR-C-Programming-2nd-Ed)
- [williamgherman/c-solutions](https://github.com/williamgherman/c-solutions)

## License

My original work in this repository is available under the [MIT License](LICENSE).
