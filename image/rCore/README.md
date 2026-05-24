# rCore Tutorial

## 简介

rCore 是一个基于 rCore-Tutorial 的教学操作系统内核实验平台，专门为 RISC-V 架构 (riscv64gc) 设计。该构建规则克隆并构建 [tg-rcore-tutorial](https://github.com/rcore-os/tg-rcore-tutorial) 仓库。

## 特性

- **多章节支持**: 支持 rCore 教程的 8 个渐进式章节 (ch1-ch8)
- **Rust 工具链**: 使用 Rust 和 Cargo 进行构建
- **QEMU 模拟**: 支持在 QEMU virt 机器上运行
- **灵活配置**: 可选择不同的章节和运行模式

## 章节说明

| 章节 | 主题 | 说明 |
|------|------|------|
| ch1 | 裸机与最小执行环境 | 最小系统启动 |
| ch2 | Batch OS、Trap、基本 syscall | 批处理与系统调用 |
| ch3 | 多道程序与分时 | 任务调度 (推荐入门章节) |
| ch4 | 地址空间与页表 | 虚拟内存管理 |
| ch5 | 进程与调度 | 进程管理与调度 |
| ch6 | 文件系统 | VirtIO 块设备与文件系统 |
| ch7 | IPC (pipe/signal) | 进程间通信与信号 |
| ch8 | 线程与并发同步 | 多线程与同步原语 |

## 快速开始

### 1. 启动 Docker 容器

```bash
cd virt-riscv64

# 创建后台容器（只需一次）
kyberlab dkrund
```

### 2. 构建

**重要**: 环境变量必须在容器内部设置！

```bash
# 构建默认章节 (ch3)
kyberlab dkexec -c "make rcore_build"

# 构建指定章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_build"

# 构建练习模式
kyberlab dkexec -c "IMAGE_RCORE_MODE=exercise IMAGE_RCORE_CHAPTER=ch3 make rcore_build"
```

### 3. 运行

```bash
# 运行默认章节 (ch3)
kyberlab dkexec -c "make rcore_action"

# 运行指定章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"

# 运行练习模式
kyberlab dkexec -c "IMAGE_RCORE_MODE=exercise IMAGE_RCORE_CHAPTER=ch3 make rcore_action"
```

### 4. 清理

```bash
# 清理构建产物
kyberlab dkexec -c "make rcore_clean"

# 完全清理
kyberlab dkexec -c "make rcore_distclean"
```

## 环境要求

- Rust toolchain (stable)
- 目标架构: `riscv64gc-unknown-none-elf`
- Rust 组件: `rust-src`, `llvm-tools-preview`
- QEMU: `qemu-system-riscv64` (>= 7.0)
- 推荐工具: `cargo-binutils`, `cargo-clone`

## 构建变量

| 变量 | 默认值 | 说明 |
|------|--------|------|
| IMAGE_RCORE_CHAPTER | ch3 | 章节号 (ch1-ch8) |
| IMAGE_RCORE_MODE | default | 运行模式 (default/exercise) |
| IMAGE_FETCH_REF | test | Git 分支或标签 |

## 工作流程

1. **Fetch**: 克隆 tg-rcore-tutorial 仓库 (包含所有章节)
2. **Build**: 使用 cargo 构建指定章节
3. **Run**: 使用 QEMU 运行构建的内核

## 目录结构

```
config/image/rCore/
├── rCore.mk          # 主构建规则
├── EmuConfig.mk      # QEMU 仿真配置
├── README.md         # 本文档
├── TEST.md           # 详细测试用例
├── QUICKSTART.md     # 快速使用指南
├── test.sh           # 单章节测试脚本
└── test_all.sh       # 全章节测试脚本
```

## 测试

### 使用测试脚本

```bash
# 进入测试脚本目录
cd virt-riscv64/config/image/rCore

# 测试单个章节
./test.sh ch3

# 测试所有章节
./test_all.sh
```

### 手动测试

```bash
# 测试所有章节
for ch in ch1 ch2 ch3 ch4 ch5 ch6 ch7 ch8; do
    echo "测试章节: $ch"
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$ch make rcore_build"
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$ch make rcore_action"
    echo "✅ $ch 测试完成"
done
```

## 更多信息

- rCore 教程仓库: https://github.com/rcore-os/tg-rcore-tutorial
- rCore 文档: https://github.com/rcore-os/tg-rcore-tutorial/tree/test/docs
- rCore 练习任务: https://github.com/rcore-os/tg-rcore-tutorial/blob/test/docs/challenges.md
