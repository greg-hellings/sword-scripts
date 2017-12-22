#!/bin/bash -ex

FLAVOR="${1}"

./configure "--prefix=${WORKSPACE}/${FLAVOR}-destination" \
	"--sysconfdir=${WORKSPACE}/${FLAVOR}-destination/etc" \
	--without-conf \
	--disable-shared \
	--enable-debug \
	--enable-tests
make -j4
make install
