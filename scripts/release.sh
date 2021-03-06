#!/bin/bash

set -ex -o pipefail

MD5="$(md5sum "${targetDirectory}.tar.gz")"
SHA512="$(sha512sum "${targetDirectory}.tar.gz")"

function release() {
	cp "${WORKSPACE}/${targetDirectory}.tar.gz" .
	find . -maxdepth 1 -mindepth 1 -type d -print0 | while read -d $'\0' directory; do rm -rf "${directory}"; done
	tar xaf "${targetDirectory}.tar.gz"
	cd ..
	find . -maxdepth 1 -mindepth 1 -type l -print0 | while read -d $'\0' link; do rm -f "${link}"; done
	ln -s "v${majorVersion}.${minorVersion}/${targetDirectory}"
	rm -f sword.tar.gz
	ln -s "v${majorVersion}.${minorVersion}/${targetDirectory}.tar.gz" sword.tar.gz
}

cd "${RELEASE_DIR}/v${majorVersion}.${minorVersion}"
URL="http://crosswire.org/ftpmirror/pub/sword/source/$(basename "$(pwd)")/${targetDirectory}.tar.gz"
release

echo -e "${MD5}\n${SHA512}\n${URL}"
