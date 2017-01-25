package=libsnark
$(package)_download_path=https://github.com/radix42/$(package)/archive/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz
$(package)_download_file=$($(package)_git_commit).tar.gz

$(package)_sha256_hash=8eb8fef8ccfc84714da0a698855f9df43c4b6439f5e718493c6e89584f31fd3a
$(package)_git_commit=17a32eea37e837cee2b054a77b5bfbfdf285e6e6

$(package)_dependencies=libgmp libsodium

define $(package)_build_cmds
  CXX="x86_64-w64-mingw32-g++-posix" CXXFLAGS="-DBINARY_OUTPUT -DPTW32_STATIC_LIB -DSTATICLIB -DNO_PT_COMPRESSION=1 -fopenmp" $(MAKE) lib DEPINST=$(host_prefix) CURVE=ALT_BN128 MULTICORE=1 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 FEATUREFLAGS=-DMONTGOMERY_OUTPUT OPTFLAGS="-O2 -march=x86-64"
endef

define $(package)_stage_cmds
  $(MAKE) install STATIC=1 DEPINST=$(host_prefix) PREFIX=$($(package)_staging_dir)$(host_prefix) CURVE=ALT_BN128 NO_SUPERCOP=1
endef
