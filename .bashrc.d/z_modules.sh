#!/bin/bash
# Load personal modules if the module command is available
[ -f /etc/profile.d/modules.sh ] && . /etc/profile.d/modules.sh
if [[ $(type -t module) == function ]]; then
    module use --append ~/modules/
fi
[ -f "$HOME/.modules" ] && . "$HOME/.modules"
