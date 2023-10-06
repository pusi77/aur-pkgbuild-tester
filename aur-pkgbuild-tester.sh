#!/usr/bin/env bash
set -e

if [ $# -lt 1 ]; then
    echo "Usage: aur-pkgbuild-tester <PKGBUILD_directory> [test_bash_script]"
    exit 1
fi

DATADIR=$(readlink -f $1)
if [ ! -d "$DATADIR" ]; then
    echo "First argument must be a directory"
    exit 1
fi

if [ ! -z "$2" ]; then
    TESTER=$(readlink -f $2)
    if [ -d "$TESTER" ]; then
        echo "Second argument must not be a directory"
        exit 1
    fi
    docker pull archlinux:base-devel
    docker run --rm -it \
        -v "$DATADIR/:/opt/pkgdir" \
        -v "$TESTER:/opt/test.sh" \
        -v "$(pwd)/scripts:/opt/scripts" \
        archlinux:base-devel \
        /opt/scripts/entrypoint.sh
else
    docker pull archlinux:base-devel
    docker run --rm -it \
        -v "$DATADIR/:/opt/pkgdir" \
        -v "$(pwd)/scripts:/opt/scripts" \
        archlinux:base-devel \
        /opt/scripts/entrypoint.sh
fi