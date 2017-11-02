#!/bin/bash -ex

export PATH="${WORKSPACE}/destination/bin/":${PATH}

# Test a basic module install
installmgr -init
installmgr -sc
installmgr -r CrossWire
installmgr -ri CrossWire KJV

# Test getting text from Diatheke
which diatheke
ldd `which diatheke`
diatheke -b KJV -k Genesis.1.1
