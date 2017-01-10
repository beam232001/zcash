/bin/sh ../libtool  --tag=CXX   --mode=link g++  -std=c++11 \
	-I/home/djm/zcash/depends/x86_64-pc-mingw64/include \
	-fopenmp -fwrapv -fno-strict-aliasing -fno-stack-protector \
	-D_FORTIFY_SOURCE=0 -g -Wl,-export-all-symbols -Wno-conversion-null \
	-Wa,-mbig-obj   \
	-L/home/djm/zcash/depends/x86_64-pc-mingw64/lib -lsodium -lsnark \
	-lboost_chrono-mt-s -lboost_filesystem-mt-s -lboost_system-mt-s \
	-lboost_thread-mt-s -lboost_timer-mt-s -lssp -lgmp -lgomp -lsnark  \
	-o libzcashconsensus.la \
	-rpath /home/djm/zcash/depends/x86_64-pc-mingw64/lib \
	crypto/libzcashconsensus_la-equihash.lo \
	crypto/libzcashconsensus_la-hmac_sha512.lo \
	crypto/libzcashconsensus_la-ripemd160.lo \
	crypto/libzcashconsensus_la-sha1.lo \
	crypto/libzcashconsensus_la-sha256.lo \
	crypto/libzcashconsensus_la-sha512.lo \
	libzcashconsensus_la-eccryptoverify.lo \
	libzcashconsensus_la-ecwrapper.lo \
	libzcashconsensus_la-hash.lo \
	primitives/libzcashconsensus_la-transaction.lo \
	libzcashconsensus_la-pubkey.lo \
	script/libzcashconsensus_la-zcashconsensus.lo \
	script/libzcashconsensus_la-interpreter.lo \
	script/libzcashconsensus_la-script.lo \
	libzcashconsensus_la-uint256.lo \
	libzcashconsensus_la-utilstrencodings.lo \
	libzcashconsensus_la-util.lo libzcashconsensus_la-chainparamsbase.lo \
	libzcashconsensus_la-utiltime.lo libzcashconsensus_la-random.lo \
	support/libzcashconsensus_la-cleanse.lo  \
	-lcrypto -L/home/djm/zcash/depends/x86_64-pc-mingw64/lib \
	-lboost_system-mt-s -lboost_filesystem-mt-s \
	-lboost_program_options-mt-s -lboost_thread-mt-s -lboost_chrono-mt-s \
	-lcrypt32 -liphlpapi -lshlwapi -lmswsock -lws2_32 -ladvapi32 \
	-lrpcrt4 -luuid -loleaut32 -lole32 -lcomctl32 -lshell32 -lwinmm \
	-lwinspool -lcomdlg32 -lgdi32 -luser32 -lkernel32 -lmingwthrd
