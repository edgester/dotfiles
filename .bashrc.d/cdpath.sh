#!/bin/bash
# Append to CDPATH
for dir in "${HOME}" "${HOME}/projects"; do
  if [[ "${CDPATH}" != *"${dir}"* ]]; then
    export CDPATH="${CDPATH:+${CDPATH}:}${dir}"
  fi
done
