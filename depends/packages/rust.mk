package=rust
$(package)_version=beta
$(package)_download_path=https://static.rust-lang.org/dist/2018-04-09
$(package)_file_name_linux=rust-$($(package)_version)-x86_64-unknown-linux-gnu.tar.gz
$(package)_sha256_hash_linux=e9a22f2c732e9e3e0774627fb565116d4871e5551464af9b22f170eb6cc79222
$(package)_file_name_darwin=rust-$($(package)_version)-x86_64-apple-darwin.tar.gz
$(package)_sha256_hash_darwin=b31b671c54ed1923ee2b98c3939b4097e43df21f2c44aa12d656f567b86d2387
$(package)_file_name_mingw32=rust-$($(package)_version)-x86_64-pc-windows-gnu.tar.gz
$(package)_sha256_hash_mingw32=913fe62358c2c41381133c368c6c6bcf6ad68899bba5fce9343aac419ffd5ee4

ifeq ($(host_os),mingw32)
$(package)_build_subdir=buildos
$(package)_extra_sources = $($(package)_file_name_$(build_os))

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_file_name_$(build_os)),$($(package)_file_name_$(build_os)),$($(package)_sha256_hash_$(build_os)))
endef

define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_sha256_hash_$(build_os))  $($(package)_source_dir)/$($(package)_file_name_$(build_os))" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir mingw32 && \
  tar --strip-components=1 -xf $($(package)_source) -C mingw32 && \
  mkdir buildos && \
  tar --strip-components=1 -xf $($(package)_source_dir)/$($(package)_file_name_$(build_os)) -C buildos
endef

define $(package)_stage_cmds
  ./install.sh --destdir=$($(package)_staging_dir) --prefix=$(host_prefix)/native --disable-ldconfig && \
  cp -r ../mingw32/rust-std-x86_64-pc-windows-gnu/lib/rustlib/x86_64-pc-windows-gnu $($(package)_staging_dir)$(host_prefix)/native/lib/rustlib
endef
else

define $(package)_stage_cmds
  ./install.sh --destdir=$($(package)_staging_dir) --prefix=$(host_prefix)/native --disable-ldconfig
endef
endif
