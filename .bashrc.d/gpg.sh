#!/bin/bash
export GPG_TTY=$(tty)
. /etc/os-release
export VERSION_ID
if [ "${VERSION_ID}" != "7.9" ]; then
  gpgconf --launch gpg-agent
fi
