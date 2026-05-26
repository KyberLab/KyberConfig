#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
# (Required) Build type
IMAGE_BUILD_TYPE			:= Linux

#
# (Required) Fetch options
IMAGE_FETCH_OPTS			:= 
IMAGE_FETCH_URL				:= https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
IMAGE_FETCH_REF				:= v6.7

#
# (Optional) Patch options
IMAGE_PATCH_OPTS			:= 

# (Required) Config options
IMAGE_CONFIG_OPTS			:= defconfig

#
# (Optional) Build options
IMAGE_BUILD_OPTS			:= 

# (Optional) Install options
IMAGE_INSTALL_OPTS			:= 
IMAGE_INSTALL_LIST			:= arch/riscv/boot/Image:Linux.bin output:$(IMAGE_BUILD_GOAL)

# (Optional) Package options
IMAGE_PACKAGE_OPTS			:= 
IMAGE_PACKAGE_LIST			:= Linux.bin $(IMAGE_BUILD_GOAL)

# (Optional) Clean options
IMAGE_CLEAN_OPTS			:= 

# (Optional) Distclean options
IMAGE_DISTCLEAN_OPTS		:= 

#
# Image Build Variables (Optional)
#
IMAGE_EXPORT_ENV			+= ARCH=riscv
IMAGE_EXPORT_ENV			+= CROSS_COMPILE=riscv64-linux-gnu-
