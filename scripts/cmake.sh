#!/bin/bash -ex

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${WORKSPACE}/${FLAVOR}-destination" ..
make -j4
make install
