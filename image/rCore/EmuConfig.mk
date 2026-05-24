#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#



QEMU_MACHINE_TYPE			:= virt
QEMU_CPU_TYPE				:= rv64
QEMU_TERM_TYPE				:= none
QEMU_STORAGE_TYPE			:= none
QEMU_NETWORK_TYPE			:= none
QEMU_GRAPHIC_TYPE			:= none
QEMU_GRAPHIC_ARGS			:= -nographic


IMAGE_BOOT_BIN				:= $(BUILD_ROOT_PATH)/tg-rcore-tutorial-$(IMAGE_RCORE_CHAPTER)/target/$(RISCARCH)/debug/rCore-Tutorial.bin

IMAGE_RUN_ARGS				+= \
	-machine $(QEMU_MACHINE_TYPE) \
	-cpu $(QEMU_CPU_TYPE) \
	-bios default \
	-device loader,file=$(IMAGE_BOOT_BIN),addr=0x80200000
