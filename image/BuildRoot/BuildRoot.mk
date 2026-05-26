#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
# (Required) Build type
IMAGE_BUILD_TYPE			:= BuildRoot

#
# (Required) Fetch options
IMAGE_FETCH_OPTS			:= 
IMAGE_FETCH_URL				:= https://git.buildroot.net/buildroot
IMAGE_FETCH_REF				:= 2024.02

# (Optional) Patch options
IMAGE_PATCH_OPTS			:= 

# (Required) Config options
IMAGE_CONFIG_OPTS			:= qemu_riscv64_virt_defconfig

# (Optional) Build options
IMAGE_BUILD_OPTS			:= 

# (Required) Install options
IMAGE_INSTALL_OPTS			:= 
IMAGE_INSTALL_LIST			:= output/images/Image:BuildRoot-Kernel.bin output/images/rootfs.ext4:BuildRoot-RootFS.ext4

# (Required) Package options
IMAGE_PACKAGE_OPTS			:= 
IMAGE_PACKAGE_LIST			:= BuildRoot-Kernel.bin BuildRoot-RootFS.ext4

# (Optional) Clean options
IMAGE_CLEAN_OPTS			:= 

# (Optional) Distclean options
IMAGE_DISTCLEAN_OPTS		:= 

#
# Image Build Variables (Optional)
#
IMAGE_BUILDROOT_DOWNLOAD	?= $(DOWNLOAD_ROOT_PATH)
