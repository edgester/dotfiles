#!/bin/bash
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
