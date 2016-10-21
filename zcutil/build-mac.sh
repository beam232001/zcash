#!/bin/bash
export CC=gcc-5
export CXX=g++-5
export AR=ar
export RANLIB=ranlib
export STRIP=strip
export LIBTOOL=libtool
export OTOOL=otool
export NM=nm
export INSTALL=install

set -eu -o pipefail

if [ "x$*" = 'x--help' ]
then
    cat <<EOF
Usage:

$0 --help
  Show this help message and exit.

$0 [ --enable-lcov ] [ MAKEARGS... ]
  Build Zcash and most of its transitive dependencies from
  source. MAKEARGS are applied to both dependencies and Zcash itself. If
  --enable-lcov is passed, Zcash is configured to add coverage
  instrumentation, thus enabling "make cov" to work.
EOF
    exit 0
fi

#set -x
#cd "$(dirname "$(readlink -f "$0")")/.."

# If --enable-lcov is the first argument, enable lcov coverage support:
LCOV_ARG=''
HARDENING_ARG='--disable-hardening'
if [ "x${1:-}" = 'x--enable-lcov' ]
then
    LCOV_ARG='--enable-lcov'
    HARDENING_ARG='--disable-hardening'
    shift
fi

# BUG: parameterize the platform/host directory:
PREFIX="$(pwd)/depends/x86_64-apple-darwin15.6.0/"

make "$@" -C ./depends/ V=1 NO_QT=1
./autogen.sh
./configure --prefix="${PREFIX}" --with-gui=no "$HARDENING_ARG" "$LCOV_ARG" CXXFLAGS='-fwrapv -fno-strict-aliasing -Werror -g' \
  --with-boost=/Users/djm/zcash/depends/x86_64-apple-darwin15.6.0
make "$@" V=1
