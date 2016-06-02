export NUPIC=$HOME/src/nupic

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# https://github.com/numenta/nupic/wiki/Numenta-Developer-Setup
export DYLD_LIBRARY_PATH=${HOME}/Library/Python/local/lib:${DYLD_LIBRARY_PATH}
export MANPATH=${HOME}/Library/Python/local/man:${MANPATH}
export PATH=${HOME}/Library/Python/local:${PATH}
export PYTHONPATH=${HOME}/Library/Python/local/lib/python2.7/site-packages:${PYTHONPATH}

# nupic.core
export ARCHFLAGS="-arch x86_64"
