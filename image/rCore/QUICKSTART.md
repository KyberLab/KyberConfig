# rCore Tutorial 快速使用指南

## 🚀 快速开始

### 1. 启动 Docker 容器（只需一次）

```bash
cd virt-riscv64
kyberlab dkrund
```

### 2. 构建 rCore

**重要**: 环境变量必须在容器内部设置！

```bash
# 构建默认章节 (ch3)
kyberlab dkexec -c "make rcore_build"

# 构建指定章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_build"
```

### 3. 运行 rCore

```bash
# 运行 rCore
kyberlab dkexec -c "make rcore_action"

# 运行指定章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"
```

## 📋 完整测试流程

### 方式一: 使用测试脚本

```bash
cd virt-riscv64/config/image/rCore

# 测试单个章节
./test.sh ch3

# 测试所有章节
./test_all.sh
```

### 方式二: 手动测试每个章节

```bash
cd virt-riscv64

# 确保容器运行
kyberlab dkrund

# 测试所有章节
for ch in ch1 ch2 ch3 ch4 ch5 ch6 ch7 ch8; do
    echo "========================================"
    echo "测试章节: $ch"
    echo "========================================"

    # 清理
    kyberlab dkexec -c "make rcore_distclean"

    # 构建
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$ch make rcore_build"

    # 运行
    kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$ch make rcore_action"

    echo "✅ $ch 测试完成"
    echo ""
done
```

## 🔧 常用命令

### Docker 操作

```bash
kyberlab dkrund          # 启动后台容器
kyberlab dkexec -c "<cmd>"  # 在容器中执行命令
kyberlab dkrun           # 交互式进入容器
kyberlab dkstop          # 停止容器
```

### 构建操作

```bash
kyberlab dkexec -c "make rcore_build"          # 构建
kyberlab dkexec -c "make rcore_clean"          # 清理
kyberlab dkexec -c "make rcore_distclean"      # 完全清理
```

### 运行操作

```bash
kyberlab dkexec -c "make rcore_action"                    # 运行默认章节
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"  # 运行指定章节
```

## 📚 各章节说明

| 章节 | 名称 | 测试命令 |
|------|------|---------|
| ch1 | 裸机程序 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch1 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch1 make rcore_action"` |
| ch2 | 批处理系统 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch2 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch2 make rcore_action"` |
| ch3 | 多道程序与特权级 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_action"` |
| ch4 | 虚存管理 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch4 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch4 make rcore_action"` |
| ch5 | 进程管理与调度 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch5 make rcore_action"` |
| ch6 | 文件系统 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch6 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch6 make rcore_action"` |
| ch7 | 信号机制 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch7 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch7 make rcore_action"` |
| ch8 | 进程间通信 | `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch8 make rcore_build"` && `kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch8 make rcore_action"` |

## ❓ 故障排除

### cargo-clone 未安装

```bash
kyberlab dkexec -c "cargo install cargo-clone"
```

### 清理后重新构建

```bash
kyberlab dkexec -c "make rcore_distclean"
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build"
```

### 查看详细日志

```bash
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_build V=1"
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=ch3 make rcore_action V=1"
```

## 📖 更多文档

- [README.md](README.md) - 完整文档
- [TEST.md](TEST.md) - 详细测试用例
