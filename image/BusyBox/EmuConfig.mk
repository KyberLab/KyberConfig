#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
#QEMU_STORAGE_TYPE			:= none

QEMU_GRAPHIC_TYPE			:= none
QEMU_GRAPHIC_ARGS			:= -nographic

IMAGE_BOOT_BIN				?= $(OUTPUT_ROOT_PATH)/BusyBox-Initrd.cpio.gz
IMAGE_LINUX_BIN				?= $(OUTPUT_ROOT_PATH)/Linux.bin
IMAGE_OPENSBI_BIN			?= $(OUTPUT_ROOT_PATH)/fw_jump.bin

IMAGE_RUN_ARGS				+= \
	-bios $(IMAGE_OPENSBI_BIN) \
	-kernel $(IMAGE_LINUX_BIN) \
	-initrd ${IMAGE_BOOT_BIN} \
	-append "root=/dev/ram0 rw rdinit=/sbin/init earlyprintk=uart8250-32bit,0x10000000 console=ttyS0"
