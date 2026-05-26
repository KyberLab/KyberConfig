#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
# (Required) Build type
IMAGE_BUILD_TYPE			:= U-Boot

#
# (Required) Fetch options
IMAGE_FETCH_OPTS			:= 
IMAGE_FETCH_URL				:= https://github.com/u-boot/u-boot.git
IMAGE_FETCH_REF				:= v2024.01

# (Optional) Patch options
IMAGE_PATCH_OPTS			:= 

# (Optional) Config options
IMAGE_CONFIG_OPTS			:= qemu-riscv64_smode_defconfig

# (Optional) Build options
IMAGE_BUILD_OPTS			:= 

# (Optional) Install options
IMAGE_INSTALL_OPTS			:= 
IMAGE_INSTALL_LIST			:= u-boot.bin:u-boot.bin u-boot.itb:u-boot.itb

# (Optional) Package options
IMAGE_PACKAGE_OPTS			:= 
IMAGE_PACKAGE_LIST			:= u-boot.bin u-boot.itb

# (Optional) Clean options
IMAGE_CLEAN_OPTS			:= 

# (Optional) Distclean options
IMAGE_DISTCLEAN_OPTS		:= 

#
# Image Build Variables (Optional)
#
IMAGE_EXPORT_ENV			+= ARCH=riscv
IMAGE_EXPORT_ENV			+= CROSS_COMPILE=riscv64-linux-gnu-
