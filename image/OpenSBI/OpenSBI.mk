#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
# (Required) Build type
IMAGE_BUILD_TYPE			:= AutoMake

#
# (Required) Fetch options
IMAGE_FETCH_OPTS			:= 
IMAGE_FETCH_URL				:= https://github.com/riscv-software-src/opensbi.git
IMAGE_FETCH_REF				:= v1.4

# (Optional) Patch options
IMAGE_PATCH_OPTS			:= 

# (Optional) Config options
IMAGE_CONFIG_OPTS			:= 

# (Optional) Build options
IMAGE_BUILD_OPTS			:= PLATFORM=generic FW_PAYLOAD=y

# (Optional) Install options
IMAGE_INSTALL_OPTS			:= 
IMAGE_INSTALL_LIST			:= build/platform/generic/firmware/fw_jump.bin:fw_jump.bin build/platform/generic/firmware/fw_payload.elf:fw_payload.elf

# (Optional) Package options
IMAGE_PACKAGE_OPTS			:= 
IMAGE_PACKAGE_LIST			:= fw_jump.bin fw_payload.elf

# (Optional) Clean options
IMAGE_CLEAN_OPTS			:= 

# (Optional) Distclean options
IMAGE_DISTCLEAN_OPTS		:= 

#
# Image Build Variables (Optional)
#
IMAGE_EXPORT_ENV			+= CROSS_COMPILE=riscv64-linux-gnu-
IMAGE_EXPORT_ENV			+= PLATFORM=generic
