#!/bin/bash -ex

FLAVOR="${1}"

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${WORKSPACE}/${FLAVOR}-destination" \
	-DLIBSWORD_LIBRARY_TYPE="Static" \
	-DSWORD_BINDINGS="Python" \
	-DSWORD_ENABLE_TESTS="Yes" \
	..
make -j8
make install
make tests
