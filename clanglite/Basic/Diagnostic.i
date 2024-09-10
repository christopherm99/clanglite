%module Diagnostic

%{
#include <clang/Basic/Diagnostic.h>
%}

namespace clang {
class DiagnosticConsumer {};
class DiagnosticsEngine {
public:
  explicit DiagnosticsEngine(clang::DiagnosticIDs *,
                             clang::DiagnosticOptions *,
                             clang::DiagnosticConsumer * = nullptr,
                             bool = true);
};
}

