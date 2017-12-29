#!/bin/bash -ex

FLAVOR="${1}"

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${WORKSPACE}/${FLAVOR}-destination" \
	-DLIBSWORD_LIBRARY_TYPE="Static" \
	-DSWORD_BINDINGS="Python" \
	..
make -j4
make install
