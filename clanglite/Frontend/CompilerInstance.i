%module CompilerInstance
%{
#include <clang/Frontend/CompilerInstance.h>
%}

%import(module="clanglite.Lex.PreprocessorOptions") "clanglite/Lex/PreprocessorOptions.i"
%import(module="clanglite.Frontend.FrontendAction") "clanglite/Frontend/FrontendAction.i"
%import(module="clanglite.Basic.Diagnostic") "clanglite/Basic/Diagnostic.i"

namespace clang {
class CompilerInstance {
public:
  CompilerInstance();
  ~CompilerInstance();
  clang::PreprocessorOptions &getPreprocessorOpts();
  clang::CompilerInvocation &getInvocation();
  bool ExecuteAction(clang::FrontendAction &);
  void createDiagnostics(clang::DiagnosticConsumer * = nullptr, bool = true);
};
}

