#!/bin/bash -ex

./autogen.sh
./usrinst.sh
make -j4
