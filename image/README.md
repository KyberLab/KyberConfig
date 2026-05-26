# RISC-V 64 镜像构建配置

本目录包含 KyberLab virt-riscv64 平台的镜像构建配置文件。

## 支持的镜像

| 镜像名称 | 类型 | 说明 |
|---------|------|------|
| **OpenSBI** | AutoMake | RISC-V Supervisor Binary Interface 固件 |
| **U-Boot** | U-Boot | 通用启动加载程序 |
| **Linux** | Linux | Linux 内核 |
| **BusyBox** | BusyBox | 轻量级 Linux 工具集（initramfs） |
| **BuildRoot** | BuildRoot | 嵌入式 Linux 系统构建工具 |
| **Yocto** | Custom | 嵌入式 Linux 发行版构建框架 |
| **rCore** | Custom | RISC-V 教学操作系统 |
| **KyberEmu** | Skip | KyberLab 模拟器配置 |

## 构建顺序

推荐的构建顺序（部分镜像依赖其他镜像）：

1. **OpenSBI** - 必需的固件
2. **U-Boot** - 可选，需要 OpenSBI
3. **Linux** - 内核，需要 OpenSBI
4. **BusyBox** - 需要 Linux 和 OpenSBI
5. **BuildRoot** - 完整系统，需要 OpenSBI
6. **Yocto** - 完整系统，需要 OpenSBI

## 构建命令

```bash
# 构建所有镜像
make

# 构建指定镜像
make build_OpenSBI
make build_U-Boot
make build_Linux
make build_BusyBox
make build_BuildRoot
make build_Yocto

# 安装镜像
make install_OpenSBI
make install_U-Boot
make install_Linux

# 运行镜像
make emu_OpenSBI
make emu_U-Boot
make emu_Linux
make emu_BusyBox
make emu_BuildRoot
make emu_Yocto
```

## QEMU 模拟器配置

每个镜像都有对应的 EmuConfig.mk 文件，配置了 QEMU 运行参数：

- **QEMU_MACHINE_TYPE**: virt（虚拟平台）
- **QEMU_CPU_TYPE**: rv64（64位 RISC-V）
- **QEMU_GRAPHIC_TYPE**: none（无图形界面）
- **QEMU_GRAPHIC_ARGS**: -nographic（文本模式）

## 依赖关系

```
OpenSBI (fw_jump.bin)
    │
    ├── U-Boot (需要加载到 0x80200000)
    │
    ├── Linux (直接引导)
    │       │
    │       └── BusyBox (initrd)
    │
    └── BuildRoot / Yocto (完整系统)
```

## 镜像输出

构建完成后，镜像文件输出到 `output/` 目录：

| 镜像 | 输出文件 |
|------|---------|
| OpenSBI | fw_jump.bin, fw_payload.elf |
| U-Boot | u-boot.bin, u-boot.itb |
| Linux | Linux.bin |
| BusyBox | BusyBox-Initrd.cpio.gz |
| BuildRoot | BuildRoot-Kernel.bin, BuildRoot-RootFS.ext4 |
| Yocto | Yocto-Image.bin, Yocto-Initramfs.bin |

## 使用示例

```bash
# 构建 OpenSBI 和 Linux
make build_OpenSBI build_Linux

# 运行 Linux
make emu_Linux

# 构建并运行 BusyBox（需要先构建 Linux 和 OpenSBI）
make build_BusyBox
make emu_BusyBox
```

## 交叉编译工具链

所有 RISC-V 镜像使用以下工具链：
- **工具链**: riscv64-unknown-linux-gnu-
- **架构**: riscv (ARCH=riscv)
