#!/bin/bash
set -e

_UID=0

# determine user by Makefile
if test -f Makefile; then
    _UID=$(stat --format=%u Makefile)
fi

echo "Using UID: $_UID"

if [ "$#" -eq 0 ]; then
    exec su-exec $_UID make latexpdf
else
    exec su-exec $_UID $@
fi
