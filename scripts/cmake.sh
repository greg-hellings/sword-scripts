#!/bin/bash

set -ex -o pipefail

FLAVOR="${1}"

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${WORKSPACE}/${FLAVOR}-destination" \
	-DLIBSWORD_LIBRARY_TYPE="Static" \
	-DSWORD_PYTHON_3:BOOL=TRUE \
	-DSWORD_PERL:BOOL=TRUE \
	-DSWORD_BUILD_TESTS="Yes" \
	..
make -j8
make install
make tests
