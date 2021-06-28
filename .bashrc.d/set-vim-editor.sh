#!/bin/bash
if [ -x /usr/bin/vimx ]; then
    export EDITOR=vimx
    alias vim=vimx
    alias vi=vimx
else
    export EDITOR=vim
fi
