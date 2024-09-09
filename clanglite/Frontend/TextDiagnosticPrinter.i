%module TextDiagnosticPrinter

%{
#include <clang/Frontend/TextDiagnosticPrinter.h>
#include <llvm/Support/raw_ostream.h>
%}

%import(module="clanglite.Basic.DiagnosticOptions") clanglite/Basic/DiagnosticOptions.i
%import(module="clanglite.Basic.Diagnostic") clanglite/Basic/Diagnostic.i

%typemap(in, numinputs=0) llvm::raw_ostream & "$1 = &llvm::errs();"

namespace clang {
class TextDiagnosticPrinter : clang::DiagnosticConsumer {
public:
  TextDiagnosticPrinter(llvm::raw_ostream &, clang::DiagnosticOptions *, bool = false);
};
}

