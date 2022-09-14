#!/bin/bash
# Make vim and all the other programs work correctly in kitty
[ "$TERM" == "xterm-kitty" ] && export TERM="xterm-256color"

alias icat="kitty +kitten icat --align=left"
