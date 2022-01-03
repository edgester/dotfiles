#!/bin/bash
if command -v vimx &> /dev/null; then
    export EDITOR=vimx
    alias vim=vimx
    alias vi=vimx
else
    export EDITOR=vim
fi
