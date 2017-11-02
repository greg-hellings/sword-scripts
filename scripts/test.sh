#!/bin/bash -ex

export PATH="${WORKSPACE}/destination/bin/":${PATH}
which diatheke
diatheke -b KJV -k Genesis.1.1
