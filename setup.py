#!/usr/bin/env python3

from setuptools import Extension, find_packages, setup
from setuptools.command.build_py import build_py as _build_py
from pathlib import Path
import subprocess

llvm_cxxflags = subprocess.check_output(['llvm-config-14', '--cxxflags']).decode('utf-8').strip().split(' ')
llvm_ldflags = subprocess.check_output(['llvm-config-14', '--ldflags']).decode('utf-8').strip().split(' ')
llvm_libs = subprocess.check_output(['llvm-config-14', '--libs', 'core']).decode('utf-8').strip().split(' ')

exts = [Extension(name=f'{str(path.parent).replace("/", ".")}._{path.stem}',
                  sources=[str(path)],
                  swig_opts=['-c++'],
                  include_dirs=['/usr/lib/llvm-14/include'],
                  extra_compile_args=[arg for arg in llvm_cxxflags if arg],
                  extra_link_args=['-shared'] + [arg for arg in llvm_ldflags + llvm_libs if arg] + ['-lclang-cpp'])
        for path in Path('.').glob('clanglite/**/*.i')]

class build_py(_build_py):
  def run(self):
    self.run_command('build_ext')
    super(build_py, self).run()

setup(name='clanglite',
      version='0.1.0',
      description='clanglite is to clang as llvmlite is to llvm ',
      author='Christopher Milan',
      license='MIT',
      packages=['clanglite', 'clanglite.CodeGen', 'clanglite.Frontend', 'clanglite.Lex', 'clanglite.Basic'],
      ext_modules=exts,
      cmdclass={'build_py': build_py})

