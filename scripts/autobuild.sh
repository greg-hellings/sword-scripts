#!/bin/bash -ex

mkdir -p ../autobuild
cd ../autobuild
../sword/configure "--prefix=${WORKSPACE}/${FLAVOR}-destination" \
	"--sysconfdir=${WORKSPACE}/${FLAVOR}-destination/etc" \
	--without-conf \
	--disable-shared \
	--enable-debug \
	--disable-tests
make -j4
make install
