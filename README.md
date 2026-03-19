# KyberLab Configuration

This directory contains all configuration files required for the KyberLab project. Different development boards use corresponding branches with the same name.


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

This project is licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file for details.
