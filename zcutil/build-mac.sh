#!/bin/bash
export CC=gcc-5
export CXX=g++-5
export LIBTOOL=libtool
export AR=ar
export RANLIB=ranlib
export STRIP=strip
export OTOOL=otool
export NM=nm

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

cd $PREFIX/include
ln -s . db
cd ../../..

./autogen.sh
CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib" \
CXXFLAGS='-I/usr/local/Cellar/gcc5/5.4.0/include/c++/5.4.0 -I$PREFIX/include -fwrapv -fno-strict-aliasing -Werror -g -Wl,-undefined -Wl,dynamic_lookup' \
./configure --prefix="${PREFIX}" --with-gui=no "$HARDENING_ARG" "$LCOV_ARG" 

make "$@" V=1
