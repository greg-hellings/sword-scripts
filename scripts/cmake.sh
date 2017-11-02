#!/bin/bash -ex

mkdir build
cd build
cmake -DCMAKE_PREFIX_DIR="${WORKSPACE}/${FLAVOR}-destination" ..
make -j4
make install
