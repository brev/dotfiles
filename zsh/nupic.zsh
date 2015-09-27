export NUPIC=$HOME/src/nupic

#export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future
export ARCHFLAGS="-arch x86_64"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export MACOSX_DEPLOYMENT_TARGET=10.10

# https://github.com/numenta/nupic/wiki/Numenta-Developer-Setup
export PATH=${HOME}/Library/Python/local:${PATH}
export PYTHONPATH=${HOME}/Library/Python/local/lib/python2.7/site-packages:${PYTHONPATH}
export DYLD_LIBRARY_PATH=${HOME}/Library/Python/local/lib:${DYLD_LIBRARY_PATH}
export MANPATH=${HOME}/Library/Python/local/man
