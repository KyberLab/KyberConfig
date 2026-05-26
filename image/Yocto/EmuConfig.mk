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

IMAGE_LINUX_BIN				?= $(OUTPUT_ROOT_PATH)/Yocto-Image.bin
IMAGE_OPENSBI_BIN			?= $(OUTPUT_ROOT_PATH)/fw_jump.bin

IMAGE_RUN_ARGS				+= \
	-machine $(QEMU_MACHINE_TYPE) \
	-cpu $(QEMU_CPU_TYPE) \
	-bios $(IMAGE_OPENSBI_BIN) \
	-kernel $(IMAGE_LINUX_BIN) \
	-append "console=ttyS0"
