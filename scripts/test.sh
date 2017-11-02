#!/bin/bash -ex

export PATH="${WORKSPACE}/${FLAVOR}-destination/bin/":${PATH}
export SWORD_PATH="${WORKSPACE}/${FLAVOR}-sword-path"

mkdir -p "${SWORD_PATH}"

# Test a basic module install
yes yes | installmgr -init
yes yes | installmgr -sc
yes yes | installmgr -r CrossWire
yes yes | installmgr -ri CrossWire KJV

# Test getting text from Diatheke
which diatheke
ldd `which diatheke`
diatheke -b KJV -k Genesis.1.1
