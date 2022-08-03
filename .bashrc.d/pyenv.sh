#!/bin/bash
# Load pyenv if it's present
if [ -d "${HOME}/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
