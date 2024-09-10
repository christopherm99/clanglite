%module FrontendAction

%{
#include <clang/Frontend/FrontendAction.h>
%}

%ignore FrontendAction;

namespace clang {
class FrontendAction {};
}

