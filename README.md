# KyberConfig Virt-X86_64

[中文版本](README_zh.md) | English Version

## Project Overview

KyberConfig Virt-X86_64 is the configuration repository for the KyberLab Virt-X86_64 project, providing build configurations for X86_64 architecture system images. This repository is used as a Git submodule in the main [Virt-X86_64](https://github.com/KyberLab/Virt-X86_64) repository.

## Directory Structure

```
KyberConfig-Virt-X86_64/
├── Default.mk           # Default build configuration
├── Network.mk           # Network and repository URL configuration
├── Repo.mk              # Source code repository references
└── image/               # Build goal (Goal) configurations
    ├── BuildRoot/       # BuildRoot configuration
    ├── CustomDemo/      # Custom demo configuration
    ├── EDK2/            # EDK2 configuration
    ├── KyberEmu/        # Emulator configuration
    ├── Linux/           # Linux kernel configuration
    ├── Qemu/            # QEMU configuration
    ├── Ubuntu/          # Ubuntu system configuration
    ├── Xen/             # Xen hypervisor configuration
    └── Yocto/           # Yocto configuration
```

## Configuration Files

### Default.mk

Default build configuration, including:
- `BUILD_PLATFORM`: Build platform (default: qemu)
- `BUILD_BOARD`: Target board (default: virt-x86_64)
- `IMAGE_BUILD_LIST`: List of images to build
- `IMAGE_DEPEND_LIST`: List of image dependencies
- `BENCH_IMG_DEFAULT`: Default workbench image

### Network.mk

Network and repository URL configuration, including:
- `REPO_URL_BASE`: Repository base URL
- `REPO_URL_PROTO`: Repository URL protocol (ssh/http)
- `REPO_URL_PORT`: Repository URL port
- `REPO_URL_GROUP`: Repository group/organization

### Repo.mk

Source code repository references for various components:
- U-Boot repository URL and reference
- Linux kernel repository URL and reference
- BusyBox repository URL and reference
- BuildRoot repository URL and reference
- QEMU repository URL and reference
- KyberEmu repository URL and reference

## Build Goal Configuration

Each build goal is located in the `image/` subdirectory and contains:

- `<GoalName>.mk`: Build configuration file
- `EmuConfig.mk`: Emulator configuration (optional)
- `Files/`: Additional files (optional)

### Supported Build Goals

| Goal | Description |
|------|-------------|
| BuildRoot | BuildRoot system image |
| CustomDemo | Custom demo image |
| EDK2 | EDK2/UEFI firmware |
| KyberEmu | KyberEmu emulator |
| Linux | Linux kernel |
| Qemu | QEMU emulator |
| Ubuntu | Ubuntu system image |
| Xen | Xen hypervisor |
| Yocto | Yocto system image |

## Usage

This repository is designed to be used as a Git submodule. Clone the main repository with:

```bash
git clone --recursive https://github.com/KyberLab/Virt-X86_64.git
```

Or initialize the submodule after cloning:

```bash
git clone https://github.com/KyberLab/Virt-X86_64.git
cd Virt-X86_64
git submodule update --init --recursive
```

## Related Projects

- [Virt-X86_64](https://github.com/KyberLab/Virt-X86_64) - Main project repository
- [KyberBench](https://github.com/KyberLab/KyberBench) - Virtual workbench environment
- [KyberImage](https://github.com/KyberLab/KyberImage) - Image building framework

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file in this repository for details.
