#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#




QEMU_TERM_TYPE				:= none
QEMU_STORAGE_TYPE			:= pcie
QEMU_NETWORK_TYPE			:= none
QEMU_GRAPHIC_TYPE			:= none
QEMU_GRAPHIC_ARGS			:= -nographic


IMAGE_BOOT_BIN				:= $(OUTPUT_ROOT_PATH)/BuildRoot-Kernel.bin

IMAGE_RUN_ARGS				+= \
	-kernel $(IMAGE_BOOT_BIN) \
	-append "console=ttyS0 root=/dev/vda rw init=/bin/sh" \
	-drive file=$(OUTPUT_ROOT_PATH)/BuildRoot-RootFS.ext2,if=none,format=raw,id=buildroot \
	-device virtio-blk,drive=buildroot


