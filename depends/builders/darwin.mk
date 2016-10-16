build_darwin_CC = gcc-5
build_darwin_CXX = g++-5
build_darwin_AR = gar
build_darwin_RANLIB = granlib
build_darwin_STRIP = gstrip
build_darwin_OTOO = otool
build_darwin_NM = gnm
build_darwin_INSTALL_NAME_TOOL=ginstall
build_darwin_SHA256SUM = shasum -a 256
build_darwin_DOWNLOAD = curl --connect-timeout $(DOWNLOAD_CONNECT_TIMEOUT) --retry $(DOWNLOAD_RETRIES) -L -o

#darwin host on darwin builder. overrides darwin host preferences.
darwin_CC=gcc-5
darwin_CXX=g++-5
darwin_AR=gar
darwin_RANLIB=granlib
darwin_STRIP=gstrip
darwin_LIBTOOL=glibtool
darwin_OTOOL=otool
darwin_NM=gnm
darwin_INSTALL_NAME_TOOL=ginstall
darwin_native_toolchain=
