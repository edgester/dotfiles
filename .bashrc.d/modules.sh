#!/bin/bash
# Load personal modules if the module command is available
if [[ $(type -t module) == function ]]; then
    module use --append ~/modules/
fi
