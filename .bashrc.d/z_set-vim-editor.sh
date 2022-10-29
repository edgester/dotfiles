#!/bin/bash
MY_VIM_PATH=$(command -v vim)
# use vimx only if spack is missing and vimx is present
if [[ "${MY_VIM_PATH}" != *spack* ]] && command -v vimx &> /dev/null ; then
    # spack detected. Use "vim" instead of "vimx"
    export EDITOR=vimx
    alias vim=vimx
    alias vi=vimx
else
    export EDITOR=vim
fi
