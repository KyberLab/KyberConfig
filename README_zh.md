# KyberConfig Virt-X86_64

[English Version](README.md) | 中文版本

## 项目简介

KyberConfig Virt-X86_64 是 KyberLab Virt-X86_64 项目的配置仓库，为 X86_64 架构系统镜像提供构建配置。本仓库作为 Git 子模块在主仓库 [Virt-X86_64](https://github.com/KyberLab/Virt-X86_64) 中使用。

## 目录结构

```
KyberConfig-Virt-X86_64/
├── Default.mk           # 默认构建配置
├── Network.mk           # 网络和仓库 URL 配置
├── Repo.mk              # 源码仓库引用配置
└── image/               # 构建目标（Goal）配置
    ├── BuildRoot/       # BuildRoot 配置
    ├── CustomDemo/      # 自定义示例配置
    ├── EDK2/            # EDK2 配置
    ├── KyberEmu/        # 模拟器配置
    ├── Linux/           # Linux 内核配置
    ├── Qemu/            # QEMU 配置
    ├── Ubuntu/          # Ubuntu 系统配置
    ├── Xen/             # Xen 虚拟化配置
    └── Yocto/           # Yocto 配置
```

## 配置文件说明

### Default.mk

默认构建配置，包括：
- `BUILD_PLATFORM`：构建平台（默认：qemu）
- `BUILD_BOARD`：目标板（默认：virt-x86_64）
- `IMAGE_BUILD_LIST`：构建镜像列表
- `IMAGE_DEPEND_LIST`：镜像依赖列表
- `BENCH_IMG_DEFAULT`：默认工作台镜像

### Network.mk

网络和仓库 URL 配置，包括：
- `REPO_URL_BASE`：仓库基础 URL
- `REPO_URL_PROTO`：仓库 URL 协议（ssh/http）
- `REPO_URL_PORT`：仓库 URL 端口
- `REPO_URL_GROUP`：仓库组/组织

### Repo.mk

各组件的源码仓库引用配置：
- U-Boot 仓库 URL 和引用
- Linux 内核仓库 URL 和引用
- BusyBox 仓库 URL 和引用
- BuildRoot 仓库 URL 和引用
- QEMU 仓库 URL 和引用
- KyberEmu 仓库 URL 和引用

## 构建目标配置

每个构建目标位于 `image/` 子目录下，包含：

- `<GoalName>.mk`：构建配置文件
- `EmuConfig.mk`：模拟器配置（可选）
- `Files/`：附加文件（可选）

### 支持的构建目标

| 目标 | 描述 |
|------|------|
| BuildRoot | BuildRoot 系统镜像 |
| CustomDemo | 自定义示例镜像 |
| EDK2 | EDK2/UEFI 固件 |
| KyberEmu | KyberEmu 模拟器 |
| Linux | Linux 内核 |
| Qemu | QEMU 模拟器 |
| Ubuntu | Ubuntu 系统镜像 |
| Xen | Xen 虚拟化平台 |
| Yocto | Yocto 系统镜像 |

## 使用方法

本仓库设计为 Git 子模块使用。克隆主仓库时：

```bash
git clone --recursive https://github.com/KyberLab/Virt-X86_64.git
```

或在克隆后初始化子模块：

```bash
git clone https://github.com/KyberLab/Virt-X86_64.git
cd Virt-X86_64
git submodule update --init --recursive
```

## 相关项目

- [Virt-X86_64](https://github.com/KyberLab/Virt-X86_64) - 主项目仓库
- [KyberBench](https://github.com/KyberLab/KyberBench) - 虚拟工作台环境
- [KyberImage](https://github.com/KyberLab/KyberImage) - 镜像构建框架

## 许可证

本项目采用 Apache License 2.0 许可证。详见仓库中的 [LICENSE](./LICENSE) 文件。
