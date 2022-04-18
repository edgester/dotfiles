#!/bin/bash
# Tell i3 to use gnome-terminal instead of xterm on RHEL
. /etc/os-release
if [ "${ID}" == "rhel" ]; then
  export TERMINAL="gnome-terminal"
else
  # use kitty terminal if available
  KITTY_PATH=$(command -v kitty)
  if [ $? -eq 0 ]; then
    export TERMINAL="${KITTY_PATH}"
  fi
fi
