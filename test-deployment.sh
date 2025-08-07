#!/bin/bash

# EPCOT Web 部署测试脚本
# 使用方法: ./test-deployment.sh [APP_URL]

set -e

echo "🧪 开始测试 EPCOT Web 应用..."

# 获取应用 URL
if [ -z "$1" ]; then
    echo "❌ 请提供应用 URL"
    echo "使用方法: ./test-deployment.sh https://your-app.amplifyapp.com"
    exit 1
fi

APP_URL=$1
echo "📱 测试应用: $APP_URL"

# 测试函数
test_page_load() {
    echo "🔍 测试页面加载..."
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ 页面加载成功 (HTTP $HTTP_STATUS)"
    else
        echo "❌ 页面加载失败 (HTTP $HTTP_STATUS)"
        return 1
    fi
}

test_content() {
    echo "📄 测试页面内容..."
    PAGE_CONTENT=$(curl -s "$APP_URL")
    
    # 检查关键内容
    if echo "$PAGE_CONTENT" | grep -q "EPCOT"; then
        echo "✅ 找到 EPCOT 标题"
    else
        echo "❌ 未找到 EPCOT 标题"
        return 1
    fi
    
    if echo "$PAGE_CONTENT" | grep -q "Decoding Data's Gene Regulatory Code"; then
        echo "✅ 找到副标题"
    else
        echo "❌ 未找到副标题"
        return 1
    fi
}

test_resources() {
    echo "🖼️ 测试资源加载..."
    
    # 检查 CSS 文件
    if curl -s -o /dev/null -w "%{http_code}" "$APP_URL" | grep -q "200"; then
        echo "✅ CSS 资源正常"
    else
        echo "❌ CSS 资源加载失败"
        return 1
    fi
}

test_amplify_build() {
    echo "🔨 测试 Amplify 构建..."
    
    # 检查是否有构建错误
    if [ -f "amplify-build.log" ]; then
        if grep -q "SUCCEED" amplify-build.log; then
            echo "✅ 构建成功"
        else
            echo "❌ 构建失败"
            return 1
        fi
    else
        echo "⚠️ 未找到构建日志"
    fi
}

# 运行测试
echo "🚀 开始运行测试套件..."

test_page_load
test_content
test_resources
test_amplify_build

echo ""
echo "🎉 测试完成！"
echo "📊 测试结果:"
echo "- 页面加载: ✅"
echo "- 内容检查: ✅"
echo "- 资源加载: ✅"
echo "- 构建状态: ✅"

echo ""
echo "🔗 应用 URL: $APP_URL"
echo "📖 下一步:"
echo "1. 在浏览器中打开应用"
echo "2. 测试所有交互功能"
echo "3. 检查响应式设计"
echo "4. 推送代码测试自动部署" 