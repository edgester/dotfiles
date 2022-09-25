#!/bin/bash
# Initialize conda if present
# Set NOCONDA to skip conda
CONDA_MATCHES=( $HOME/anaconda* )
if [ -d "${CONDA_MATCHES[0]}" -a -z "${NOCONDA}" ]; then
  CONDA_BASEDIR="${CONDA_MATCHES[0]}"

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(${CONDA_BASEDIR} 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_BASEDIR}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_BASEDIR}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_BASEDIR}/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
fi
