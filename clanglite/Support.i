%module Support

%{
#include <llvm/Support/TargetSelect.h>
%}

namespace llvm {
  inline void InitializeAllTargets();
  inline void InitializeAllTargetMCs();
  inline void InitializeAllAsmPrinters();
  inline void InitializeAllAsmParsers();
}

