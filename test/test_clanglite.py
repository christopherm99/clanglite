from clanglite.Support import *
from clanglite.Frontend import CompilerInstance, CompilerInvocation, TextDiagnosticPrinter
from clanglite.CodeGen import EmitAssemblyAction
from clanglite.Basic import DiagnosticsEngine, DiagnosticOptions

InitializeAllTargets()
InitializeAllTargetMCs()
InitializeAllAsmPrinters()
InitializeAllAsmParsers()

diag_opts = DiagnosticOptions()
diag_print = TextDiagnosticPrinter(diag_opts)
diag_eng = DiagnosticsEngine(None, diag_opts, diag_print, False)
diag_print.thisown = False

cc = CompilerInstance()

if not CompilerInvocation.CreateFromArgs(cc.getInvocation(), [b"filename.c", b"-v"], diag_eng):
  print('Failed to create CompilerInvocation')
  exit(1)

cc.createDiagnostics(diag_print)

cc.getPreprocessorOpts().addRemappedFile(b"filename.c", b"int fxn() { return 0; }")

action = EmitAssemblyAction()

if not cc.ExecuteAction(action):
  print("Failed to ExecuteAction")
  exit(1)

print('seems like it worked?')

