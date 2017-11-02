#!/bin/bash -ex

mkdir autobuild
cd autobuild
../configure "--prefix=${WORKSPACE}/${FLAVOR}-destination" \
	"--sysconfdir=${WORKSPACE}/${FLAVOR}-destination/etc" \
	--without-conf \
	--disable-shared \
	--enable-debug
make -j4
make install
