#!/usr/bin/env bash

# From https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

# Init pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Get latest Python version
PYTHON2_VERSION=$(pyenv install -l | grep -e '2.[0-9]\+.[0-9]\+$' | grep -v - |
                  tail -1 | tr -d '[:space:]')

PYTHON3_VERSION=$(pyenv install -l | grep -e '3.[0-9]\+.[0-9]\+$' | grep -v - |
                  tail -1 | tr -d '[:space:]')

pyenv install $PYTHON2_VERSION
pyenv install $PYTHON3_VERSION

pyenv virtualenv $PYTHON2_VERSION neovim2
pyenv virtualenv $PYTHON3_VERSION neovim3

pyenv activate neovim2
pip install --upgrade pip
pip install neovim

pyenv activate neovim3
pip install --upgrade pip
pip install neovim

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
pip install isort
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH
ln -s `pyenv which isort` ~/bin/isort  # Assumes that $HOME/bin is in $PATH
