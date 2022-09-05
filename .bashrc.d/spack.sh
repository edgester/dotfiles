#!/bin/bash
# https://spack.io
SPACK_BASE="${HOME}/spack"
if [ -f "${SPACK_BASE}/share/spack/setup-env.sh" ]; then
    source  "${SPACK_BASE}/share/spack/setup-env.sh"
fi
