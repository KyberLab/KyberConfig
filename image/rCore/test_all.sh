#!/bin/bash

# rCore Tutorial 完整测试脚本
# 测试所有章节 (ch1-ch8)

set -e

echo "========================================"
echo "rCore Tutorial 完整测试"
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

# 测试章节列表
CHAPTERS=("ch1" "ch2" "ch3" "ch4" "ch5" "ch6" "ch7" "ch8")

# 测试计数器
PASSED=0
FAILED=0

# 测试每个章节
for chapter in "${CHAPTERS[@]}"; do
    echo "========================================"
    echo "测试章节: $chapter"
    echo "========================================"
    echo ""

    echo "[构建] 章节 $chapter..."

    # 清理之前的构建
    kyberlab dkexec -c "cd /ws && make rcore_distclean 2>&1 | grep -v '^\s*$'" || true

    # 构建 - 环境变量在容器内部设置
    if kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$chapter make rcore_build" 2>&1 | grep -q "Finished.*target"; then
        echo "✅ 构建成功"
    else
        echo "❌ 构建失败"
        ((FAILED++))
        continue
    fi
    echo ""

    echo "[运行] 章节 $chapter..."

    # 运行 - 环境变量在容器内部设置
    if kyberlab dkexec -c "IMAGE_RCORE_CHAPTER=$chapter make rcore_action" 2>&1 | grep -q "exit with code 0\|Application exited successfully"; then
        echo "✅ 运行成功"
        ((PASSED++))
    else
        echo "❌ 运行失败"
        ((FAILED++))
    fi
    echo ""

done

# 测试总结
echo "========================================"
echo "测试总结"
echo "========================================"
echo ""
echo "总章节数: ${#CHAPTERS[@]}"
echo "通过: $PASSED"
echo "失败: $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "🎉 所有章节测试通过!"
    exit 0
else
    echo "⚠️  有 $FAILED 个章节测试失败"
    exit 1
fi
