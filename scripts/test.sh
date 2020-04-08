#!/bin/bash

set -ex -o pipefail

FLAVOR="${1}"
export PATH="${WORKSPACE}/${FLAVOR}-destination/bin/":${PATH}
export SWORD_PATH="${WORKSPACE}/${FLAVOR}-sword-path"

mkdir -p "${SWORD_PATH}/mods.d"

# Test a basic module install
which installmgr
ldd "`which installmgr`"
yes yes | installmgr -init
yes yes | installmgr -sc
yes yes | installmgr -r CrossWire
yes yes | installmgr -ri CrossWire KJV

# Test getting text from Diatheke
which diatheke
ldd "`which diatheke`"
diatheke -b KJV -k Genesis.1.1
