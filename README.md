# clanglite

clanglite is to clang as llvmlite is to llvm. That is, clanglite is a set of
Python bindings to the clang C++ API, because the existing `libclang` bindings
are not sufficient to actually compile code.

Inspired by [this blog post](https://blog.memzero.de/libclang-c-to-llvm-ir/).

## Installation

First install dependencies: [swig](https://www.swig.org) and clang 14 (on
ubuntu: `apt install swig clang-14 libclang-14-dev libclang-cpp14-dev`).

Install using pip (ie. `pip install .`).

## Usage

See `test/test_clanglite.py` for example usage.

## Compatibility

Tested with clang 14. Should work OOB with nearby versions (see `setup.py`).

