#!/usr/bin/env bash

set -e  # Exit on error

# From https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

# Init pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Get latest Python 3 version
PYTHON3_VERSION=$(pyenv install -l | grep -e '3.[0-9]\+.[0-9]\+$' | grep -v - |
                  tail -1 | tr -d '[:space:]')

pyenv install $PYTHON3_VERSION

pyenv virtualenv $PYTHON3_VERSION neovim3

pyenv shell neovim3
pip install --upgrade pip
pip install pynvim

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
pip install isort
ln -s "$(pyenv which flake8)" "$HOME/bin/flake8"  # Assumes that $HOME/bin is in $PATH
ln -s "$(pyenv which isort)" "$HOME/bin/isort"  # Assumes that $HOME/bin is in $PATH
