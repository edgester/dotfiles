#!/bin/bash
# Tell i3 to use gnome-terminal instead of xterm on RHEL
. /etc/os-release
if [ "${ID}" == "rhel" ]; then
  export TERMINAL="gnome-terminal"
fi
