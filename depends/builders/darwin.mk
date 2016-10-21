build_darwin_CC = gcc-5
build_darwin_CXX = g++-5
build_darwin_AR = ar
build_darwin_RANLIB = ranlib
build_darwin_STRIP = strip
build_darwin_OTOO = otool
build_darwin_NM = nm
build_darwin_INSTALL_NAME_TOOL=$(shell xcrun -f install_name_tool)
build_darwin_SHA256SUM = shasum -a 256
build_darwin_DOWNLOAD = curl --connect-timeout $(DOWNLOAD_CONNECT_TIMEOUT) --retry $(DOWNLOAD_RETRIES) -L -o

#darwin host on darwin builder. overrides darwin host preferences.
darwin_CC=gcc-5
darwin_CXX=g++-5
darwin_AR=ar
darwin_RANLIB=ranlib
darwin_STRIP=strip
darwin_LIBTOOL=libtool
darwin_OTOOL=otool
darwin_NM=nm
darwin_INSTALL_NAME_TOOL=$(shell xcrun -f install_name_tool)
darwin_native_toolchain=
