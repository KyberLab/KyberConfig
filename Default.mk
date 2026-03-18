#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#




###############################################################################
# Build Config

BUILD_PLATFORM				:= qemu
BUILD_BOARD					:= virt-x86_64

BUILD_TYPE_NUM				?= 3
BUILD_TYPE_STR				?= test
BUILD_VARIANT				?= Community

IMAGE_BUILD_LIST			?= Linux BuildRoot Ubuntu KyberEmu
IMAGE_DEPEND_LIST			?= Yocto:Xen

BENCH_IMG_DEFAULT			?= $(BUILD_BOARD)

