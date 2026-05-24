# rCore Tutorial 测试用例

## 目录

- [环境准备](#环境准备)
- [测试命令](#测试命令)
- [测试用例](#测试用例)
  - [章节 1: 裸机程序 (ch1)](#章节-1-裸机程序-ch1)
  - [章节 2: 批处理系统 (ch2)](#章节-2-批处理系统-ch2)
  - [章节 3: 多道程序与特权级 (ch3)](#章节-3-多道程序与特权级-ch3)
  - [章节 4: 虚存管理 (ch4)](#章节-4-虚存管理-ch4)
  - [章节 5: 进程管理与调度 (ch5)](#章节-5-进程管理与调度-ch5)
  - [章节 6: 文件系统 (ch6)](#章节-6-文件系统-ch6)
  - [章节 7: 信号机制 (ch7)](#章节-7-信号机制-ch7)
  - [章节 8: 进程间通信 (ch8)](#章节-8-进程间通信-ch8)

---

## 环境准备

### 1. 创建后台 Docker 容器（仅需一次）

```bash
cd virt-riscv64
kyberlab dkrund
```

### 2. 进入容器

```bash
kyberlab dkexec -c "<command>"
```

### 3. 确认环境

```bash
# 检查工具链
kyberlab dkexec -c "rustc --version"
kyberlab dkexec -c "cargo --version"
kyberlab dkexec -c "riscv64-unknown-elf-gcc --version"

# 检查 cargo-clone（rCore 构建必需）
kyberlab dkexec -c "cargo clone --version || cargo install cargo-clone"

# 检查 QEMU
kyberlab dkexec -c "qemu-system-riscv64 --version"
```

---

## 测试命令

### 基本命令

| 命令 | 说明 |
|------|------|
| `kyberlab dkrund` | 创建后台 Docker 容器 |
| `kyberlab dkexec -c "<cmd>"` | 在容器中执行命令 |
| `kyberlab dkstop` | 停止容器 |
| `kyberlab dkrm` | 删除容器 |

### 构建命令

**重要**: 环境变量必须在容器内部设置！

| 命令 | 说明 |
|------|------|
| `kyberlab dkexec -c "make rcore_build"` | 构建默认章节 (ch3) |
| `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_build"` | 构建指定章节 |
| `kyberlab dkexec -c "make rcore_clean"` | 清理构建产物 |
| `kyberlab dkexec -c "make rcore_distclean"` | 完全清理 |

### 运行命令

| 命令 | 说明 |
|------|------|
| `kyberlab dkexec -c "make rcore_action"` | 运行默认章节 (ch3) |
| `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"` | 运行指定章节 |

---

## 测试用例

### 章节 1: 裸机程序 (ch1)

**简介**: 编写裸机程序，不依赖任何操作系统，实现最简单的输出功能。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch1 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch1 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ QEMU 正常启动
- ✅ 输出 "Hello, RVOS!"
- ✅ 程序正常退出

---

### 章节 2: 批处理系统 (ch2)

**简介**: 实现简单的批处理系统，加载并执行多个程序。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch2 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch2 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 批处理系统正常加载程序
- ✅ 多个应用程序顺序执行
- ✅ 所有应用程序正常退出

---

### 章节 3: 多道程序与特权级 (ch3)

**简介**: 实现多道程序设计和特权级切换，支持用户态和内核态。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 日志系统正常工作 (INFO/WARN/ERROR)
- ✅ 多道程序正常加载和切换
- ✅ 用户态程序正常执行
- ✅ 异常处理正常
- ✅ 所有应用程序正常退出

---

### 章节 4: 虚存管理 (ch4)

**简介**: 实现虚拟内存管理，支持分页机制。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch4 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch4 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 物理内存管理初始化成功
- ✅ 虚拟内存映射正常工作
- ✅ 所有应用程序正常退出

---

### 章节 5: 进程管理与调度 (ch5)

**简介**: 实现进程管理和调度算法。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 进程管理初始化成功
- ✅ 调度器正常工作
- ✅ 多进程并发执行
- ✅ 进程退出和回收正常

---

### 章节 6: 文件系统 (ch6)

**简介**: 实现简单的文件系统，支持文件的创建、读写和删除。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch6 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch6 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 文件系统初始化成功
- ✅ 文件创建、写入、读取正常
- ✅ 文件系统完整性检查通过

---

### 章节 7: 信号机制 (ch7)

**简介**: 实现信号机制，支持进程间信号通信。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch7 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch7 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ 信号子系统初始化成功
- ✅ 信号发送和接收正常
- ✅ 信号处理函数正常执行

---

### 章节 8: 进程间通信 (ch8)

**简介**: 实现进程间通信机制，支持管道和共享内存。

**构建**:
```bash
cd virt-riscv64
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch8 make rcore_build"
```

**运行**:
```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch8 make rcore_action"
```

**验收标准**:
- ✅ 成功编译无错误
- ✅ IPC 子系统初始化成功
- ✅ 管道通信正常
- ✅ 共享内存正常

---

## 完整测试流程

### 快速测试脚本

```bash
#!/bin/bash

# rCore Tutorial 完整测试脚本

set -e

echo "========================================"
echo "rCore Tutorial 完整测试"
echo "========================================"

# 确保容器运行
if ! docker ps | grep -q "virt-riscv64"; then
    kyberlab dkrund
    sleep 2
fi

CHAPTERS=("ch1" "ch2" "ch3" "ch4" "ch5" "ch6" "ch7" "ch8")

for chapter in "${CHAPTERS[@]}"; do
    echo ""
    echo "========================================"
    echo "测试章节: $chapter"
    echo "========================================"

    # 清理
    kyberlab dkexec -c "make rcore_distclean"

    # 构建
    echo "[构建] $chapter..."
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$chapter make rcore_build"

    # 运行
    echo "[运行] $chapter..."
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$chapter make rcore_action"

    echo "✅ $chapter 测试通过"
    echo ""
done

echo "========================================"
echo "🎉 所有章节测试通过!"
echo "========================================"
```

### 交互式测试

```bash
# 进入测试目录
cd virt-riscv64

# 确保容器运行
kyberlab dkrund

# 测试单个章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build"
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_action"
```

---

## 故障排除

### 问题 1: cargo-clone 未安装

**错误**:
```
error: no such command: `clone`
```

**解决**:
```bash
kyberlab dkexec -c "cargo install cargo-clone"
```

### 问题 2: 构建失败

**解决**:
```bash
# 清理并重新构建
kyberlab dkexec -c "make rcore_distclean"
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build"
```

### 问题 3: 容器未启动

**错误**:
```
Error: No such container
```

**解决**:
```bash
kyberlab dkrund
```

---

## 参考资料

- rCore Tutorial 官方文档: https://github.com/rcore-os/tg-rcore-tutorial
- QEMU RISC-V 文档: https://www.qemu.org/docs/master/system/riscv/virt.html
- RISC-V 特权规范: https://github.com/riscv/riscv-isa-manual
