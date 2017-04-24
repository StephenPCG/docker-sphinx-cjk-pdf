#!/bin/bash
set -e

# install requirements
if test -f requirements.txt; then
    pip install -r requirements.txt
fi

# determine user by Makefile
_UID=0
if test -f Makefile; then
    _UID=$(stat --format=%u Makefile)
fi

echo "Using UID: $_UID"

if [ "$#" -eq 0 ]; then
    exec su-exec $_UID make latexpdf
else
    exec su-exec $_UID $@
fi
