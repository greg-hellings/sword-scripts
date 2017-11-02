#!/bin/bash -ex

./configure "--prefix=${WORKSPACE}/destination" \
	"--sysconfdir=${WORKSPACE}/destination/etc" \
	--without-conf \
	--disable-shared \
	--enable-debug
make -j4
make install
