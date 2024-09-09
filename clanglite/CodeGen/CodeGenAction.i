%module CodeGenAction
%{
#include "clang/CodeGen/CodeGenAction.h"
%}

%import(module="clanglite.Frontend.FrontendAction") "clanglite/Frontend/FrontendAction.i"

namespace clang {
class EmitAssemblyAction : public clang::FrontendAction {
public:
  EmitAssemblyAction(llvm::LLVMContext * = nullptr);
};
}

