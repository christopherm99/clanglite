%module DiagnosticOptions

%{
#include <clang/Basic/DiagnosticOptions.h>
%}

namespace clang {
class DiagnosticOptions {
public:
  DiagnosticOptions();
};
}

