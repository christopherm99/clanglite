%module PreprocessorOptions
%{
#include "clang/Lex/PreprocessorOptions.h"
%}

%typemap(in) llvm::StringRef "$1 = llvm::StringRef(PyBytes_AsString($input));"
%typemap(in) llvm::MemoryBuffer * "$1 = llvm::MemoryBuffer::getMemBuffer(PyBytes_AsString($input)).release();"

namespace clang {
class PreprocessorOptions {
public:
  void addRemappedFile(llvm::StringRef, llvm::MemoryBuffer *);
};
}

