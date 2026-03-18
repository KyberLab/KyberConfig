# KyberLab Virt-AArch64 Configuration

This directory contains all configuration files and image target configurations for the Virt-AArch64 project.

## Directory Structure

```
config/
├── Default.mk         # Build default configuration
├── Network.mk         # Network and repository URL configuration
├── Repo.mk            # Repository configuration for each image
├── image/             # Image target configuration directory
│   ├── BuildRoot/     # BuildRoot image configuration
│   ├── BusyBox/       # BusyBox image configuration
│   ├── CustomDemo/    # Custom demo configuration
│   ├── EDK2/          # EDK2 UEFI image configuration
│   ├── Grub/          # Grub image configuration
│   ├── KyberEmu/     # KyberEmu emulator configuration
│   ├── Linux/         # Linux kernel image configuration
│   ├── OP-TEE/        # OP-TEE security framework configuration
│   ├── Qemu/          # Qemu emulator configuration
│   ├── U-Boot/        # U-Boot bootloader configuration
│   ├── Ubuntu/        # Ubuntu system image configuration
│   ├── Xen/           # Xen hypervisor configuration
│   └── Yocto/         # Yocto system image configuration
└── README.md          # This file
```

## Configuration Files

### Default.mk
- Build platform configuration: `BUILD_PLATFORM`, `BUILD_BOARD`
- Build type configuration: `BUILD_TYPE_NUM`, `BUILD_TYPE_STR`, `BUILD_VARIANT`
- Image list configuration: `IMAGE_BUILD_LIST`, `IMAGE_DEPEND_LIST`

### Network.mk
- Repository URL configuration: `REPO_URL_IP`, `REPO_URL_PROTO`, `REPO_URL_BASE`
- Repository base path: `REPO_URL_GIT_BASE`

### Repo.mk
- Repository address and branch configuration for each image
- Supported images: U-Boot, Linux, BusyBox, BuildRoot, Emu, Qemu
- Development and release branch configuration

## Usage

These configuration files are automatically loaded and used by the main project's Makefile. Please refer to the main project documentation for detailed usage instructions.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](../LICENSE) file for details.
