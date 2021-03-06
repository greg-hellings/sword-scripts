#!/bin/bash

set -ex -o pipefail

FLAVOR="${1}"

./configure "--prefix=${WORKSPACE}/${FLAVOR}-destination" \
	"--sysconfdir=${WORKSPACE}/${FLAVOR}-destination/etc" \
	--without-conf \
	--disable-shared \
	--enable-debug \
	--enable-tests
make -j8
make install

cd tests/testsuite
./runall.sh
