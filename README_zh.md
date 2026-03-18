# KyberLab Virt-AArch64 配置

本目录包含 Virt-AArch64 项目的所有配置文件和镜像目标配置。

## 目录结构

```
config/
├── Default.mk         # 构建默认配置
├── Network.mk         # 网络和仓库URL配置
├── Repo.mk            # 各镜像的仓库配置
├── image/             # 镜像目标配置目录
│   ├── BuildRoot/     # BuildRoot 镜像配置
│   ├── BusyBox/       # BusyBox 镜像配置
│   ├── CustomDemo/    # 自定义演示配置
│   ├── EDK2/          # EDK2 UEFI 镜像配置
│   ├── Grub/          # Grub 镜像配置
│   ├── KyberEmu/     # KyberEmu 模拟器配置
│   ├── Linux/         # Linux 内核镜像配置
│   ├── OP-TEE/        # OP-TEE 安全框架配置
│   ├── Qemu/          # Qemu 模拟器配置
│   ├── U-Boot/        # U-Boot 引导加载器配置
│   ├── Ubuntu/        # Ubuntu 系统镜像配置
│   ├── Xen/           # Xen 虚拟机监控器配置
│   └── Yocto/         # Yocto 系统镜像配置
└── README_zh.md       # 本文件
```

## 配置文件说明

### Default.mk
- 构建平台配置：`BUILD_PLATFORM`、`BUILD_BOARD`
- 构建类型配置：`BUILD_TYPE_NUM`、`BUILD_TYPE_STR`、`BUILD_VARIANT`
- 镜像列表配置：`IMAGE_BUILD_LIST`、`IMAGE_DEPEND_LIST`

### Network.mk
- 仓库URL配置：`REPO_URL_IP`、`REPO_URL_PROTO`、`REPO_URL_BASE`
- 仓库基础路径：`REPO_URL_GIT_BASE`

### Repo.mk
- 各镜像的仓库地址和分支配置
- 支持的镜像：U-Boot、Linux、BusyBox、BuildRoot、Emu、Qemu
- 开发版和发布版分支配置

## 使用方法

这些配置文件由主项目的 Makefile 自动加载和使用。详细使用方法请参阅主项目文档。

## 许可证

本项目采用 Apache License 2.0 许可证。详见 [LICENSE](./LICENSE) 文件。
