#!/bin/bash -ex

./usrinst.sh "--prefix=${WORKSPACE}/destination"
make -j4
make install
