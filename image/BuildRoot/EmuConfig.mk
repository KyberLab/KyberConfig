#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#
#
#
#
#
QEMU_MACHINE_TYPE			:= virt
QEMU_CPU_TYPE				:= rv64
QEMU_TERM_TYPE				:= none
QEMU_STORAGE_TYPE			:= none
QEMU_NETWORK_TYPE			:= none
QEMU_GRAPHIC_TYPE			:= none
QEMU_GRAPHIC_ARGS			:= -nographic

IMAGE_LINUX_BIN				?= $(OUTPUT_ROOT_PATH)/BuildRoot-Kernel.bin
IMAGE_ROOTFS_BIN			?= $(OUTPUT_ROOT_PATH)/BuildRoot-RootFS.ext4
IMAGE_OPENSBI_BIN			?= $(OUTPUT_ROOT_PATH)/fw_jump.bin

IMAGE_RUN_ARGS				+= \
	-machine $(QEMU_MACHINE_TYPE) \
	-cpu $(QEMU_CPU_TYPE) \
	-bios $(IMAGE_OPENSBI_BIN) \
	-kernel $(IMAGE_LINUX_BIN) \
	-drive file=$(IMAGE_ROOTFS_BIN),format=raw,id=hd0 \
	-device virtio-blk-device,drive=hd0 \
	-append "root=/dev/vda rw console=ttyS0"
