#!/bin/bash -ex

cp "${targetDirectory}.tar.gz" "${RELEASE_DIR}/v${majorVersion}.${minorVersion}"
MD5="$(md5sum "${targetDirectory}.tar.gz")"
SHA512="$(sha512sum "${targetDirectory}.tar.gz")"

cd "${RELEASE_DIR}/v${majorVersion}.${minorVersion}"
find . -depth 1 -type d -print0 | while read -d $'\0' directory; do rm -rf "${directory}"; done
tar xaf "${targetDirectory}.tar.gz"
cd ..
find . -depth 1 -type l -print0 | while read -d $'\0' link; do rm -f "${link}"; done
ln -s "v${majorVersion}.${minorVersion}/${targetDirectory}"
rm -f sword.tar.gz
ln -s "v${majorVersion}.${minorVersion}/${targetDirectory}.tar.gz" sword.tar.gz

echo "${MD5}\n${SHA512}"
echo "http://crosswire.org/sword/$(basename "$(dirname "$(pwd)")")/$(basename "$(pwd)")/${targetDirectory}.tar.gz"
