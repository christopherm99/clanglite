%module CompilerInvocation
%{
#include "clang/Frontend/CompilerInvocation.h"
%}

%typemap(in) llvm::ArrayRef<const char *> {
  if (PyList_Check($input)) {
    int len = PyList_Size($input);
    const char **arr = (const char **) malloc(len*sizeof(char *));
    for (int i = 0; i < len; i++) {
      PyObject *obj = PyList_GetItem($input, i);
      if (PyBytes_Check(obj)) arr[i] = PyBytes_AsString(PyList_GetItem($input, i));
      else {
        PyErr_SetString(PyExc_TypeError, "list must contain bytestrings");
        SWIG_fail;
      }
    }
    $1 = llvm::ArrayRef<const char *>(arr, len);
  } else {
    PyErr_SetString(PyExc_TypeError, "must be list");
    SWIG_fail;
  }
}

/* TODO: fix memory leak
%typemap(freearg) llvm::ArrayRef<const char *> {
  free((void *)arr);
}
*/

%typecheck(SWIG_TYPECHECK_STRING_ARRAY) llvm::ArrayRef<const char *> {
  $1 = PyList_Check($input) ? 1 : 0;
}

namespace clang {
class CompilerInvocation {
public:
  static bool CreateFromArgs(CompilerInvocation &,
                             llvm::ArrayRef<const char *>,
                             clang::DiagnosticsEngine &,
                             const char * = nullptr);
};
}

