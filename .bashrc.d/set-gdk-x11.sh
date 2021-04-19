#!/bin/bash
# Make GDK apps, like gnome-terminal, work under FastX on EL8
. /etc/os-release
if [ "${PLATFORM_ID}" == "platform:el8" ]; then
  [ -z "$SSH_CONNECTION" ] && return
  [ -z "$DISPLAY" ] && return
  #[ "$SHLVL" -gt 1 ] && return
  GDK_BACKEND=x11; export GDK_BACKEND
  [ \! -x /usr/bin/dbus-launch ] && return
  #[ -s "$DBUS_SESSION_BUS_ADDRESS" ] && return
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi
