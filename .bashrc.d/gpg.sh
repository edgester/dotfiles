#!/bin/bash
# for some reason, this causes login on RHEL8 to be really slow
export GPG_TTY=$(tty)
. /etc/os-release
export VERSION_ID
if [ "${VERSION_ID}" != "7.9" ]; then
  gpgconf --launch gpg-agent
fi
