# clanglite

clanglite is to clang as llvmlite is to llvm. That is, clanglite is a set of
Python bindings to the clang C++ API, because the existing `libclang` bindings
are not sufficient to actually compile code.

Inspired by [this blog post](https://blog.memzero.de/libclang-c-to-llvm-ir/).

## Installation

First install dependencies: [swig](https://www.swig.org) and clang. See below
for details on compatible clang versions. Please install clang using
[this guide](https://apt.llvm.org/) to ensure that all dependencies are
installed.

Install using pip (ie. `pip install .`).

## Usage

See `test/test_clanglite.py` for example usage.

## Compatibility

Tested with clang 14 and 19.

