build_darwin_CC = gcc-5
build_darwin_CXX = g++-5
build_darwin_AR = gar
build_darwin_RANLIB = $(shell xcrun -f ranlib)
build_darwin_STRIP = $(shell xcrun -f strip)
build_darwin_OTOO = $(shell xcrun -f otool)
build_darwin_NM = $(shell xcrun -f nm)
build_darwin_INSTALL_NAME_TOOL=install
build_darwin_SHA256SUM = shasum -a 256
build_darwin_DOWNLOAD = curl --connect-timeout $(DOWNLOAD_CONNECT_TIMEOUT) --retry $(DOWNLOAD_RETRIES) -L -o

#darwin host on darwin builder. overrides darwin host preferences.
darwin_CC=gcc-5
darwin_CXX=g++-5
darwin_AR=gar
darwin_RANLIB=$(shell xcrun -f ranlib)
darwin_STRIP=$(shell xcrun -f strip)
darwin_LIBTOOL=$(shell xcrun -f libtool)
darwin_OTOOL=$(shell xcrun -f otool)
darwin_NM=$(shell xcrun -f nm)
darwin_INSTALL_NAME_TOOL=install
darwin_native_toolchain=
