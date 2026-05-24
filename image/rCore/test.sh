#!/bin/bash

# rCore Tutorial 快速测试脚本
# 测试单个指定章节

set -e

# 检查参数
if [ -z "$1" ]; then
    echo "用法: $0 <章节号>"
    echo "例如: $0 ch3"
    echo ""
    echo "可用章节: ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8"
    exit 1
fi

CHAPTER=$1

# 验证章节
VALID_CHAPTERS=("ch1" "ch2" "ch3" "ch4" "ch5" "ch6" "ch7" "ch8")
if [[ ! " ${VALID_CHAPTERS[@]} " =~ " ${CHAPTER} " ]]; then
    echo "错误: 无效的章节 $CHAPTER"
    echo "可用章节: ${VALID_CHAPTERS[@]}"
    exit 1
fi

echo "========================================"
echo "rCore Tutorial 测试"
echo "章节: $CHAPTER"
echo "========================================"
echo ""

# 检查容器是否运行
echo "[检查] Docker 容器状态..."
if ! docker ps | grep -q "virt-riscv64"; then
    echo "[启动] Docker 容器..."
    kyberlab dkrund
    sleep 2
fi
echo "✅ Docker 容器已启动"
echo ""

# 清理之前的构建
echo "[清理] 之前的构建产物..."
kyberlab dkexec -c "cd /ws && make rcore_distclean 2>&1 | grep -v '^\s*$'" || true
echo ""

# 构建 - 环境变量在容器内部设置
echo "[构建] rCore $CHAPTER..."
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$CHAPTER make rcore_build"
echo "✅ 构建完成"
echo ""

# 运行 - 环境变量在容器内部设置
echo "[运行] rCore $CHAPTER..."
kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$CHAPTER make rcore_action"
echo "✅ 运行完成"
echo ""

echo "========================================"
echo "🎉 rCore $CHAPTER 测试通过!"
echo "========================================"
