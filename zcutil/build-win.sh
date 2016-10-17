#!/bin/bash

# sanitize path because the one we get from Windows is garbage with spaces in it and
# the makefiles in depends don't quote the path when they hand it to bash for ./configure
export PATH=/mingw64/bin/:/usr/local/bin:/usr/bin:/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

HOST="x86_64-pc-mingw64"

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

set -x
cd "$(dirname "$(readlink -f "$0")")/.."

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
PREFIX="$(pwd)/depends/$HOST"

#make HOST=$HOST "$@" -C ./depends/ V=1 NO_QT=1
#DBINC="${PREFIX}/include/bdb5.3"
#mkdir -p $DBINC
#cp ${PREFIX}/include/db*h $DBINC

#./autogen.sh
CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib" \
CXXFLAGS="-I$PREFIX/include -fwrapv -fno-strict-aliasing -Werror -g" \
./configure --prefix="${PREFIX}"  --with-gui=no --with-boost="$PREFIX" "$HARDENING_ARG" "$LCOV_ARG"



make "$@" V=1
