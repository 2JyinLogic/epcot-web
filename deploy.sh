#!/bin/bash

# EPCOT Web 部署脚本
# 使用方法: ./deploy.sh

set -e

echo "🚀 开始部署 EPCOT Web 应用..."

# 检查必要的工具
check_requirements() {
    echo "📋 检查部署要求..."
    
    # 检查 git
    if ! command -v git &> /dev/null; then
        echo "❌ Git 未安装，请先安装 Git"
        exit 1
    fi
    
    # 检查 npm
    if ! command -v npm &> /dev/null; then
        echo "❌ npm 未安装，请先安装 Node.js"
        exit 1
    fi
    
    # 检查 AWS CLI
    if ! command -v aws &> /dev/null; then
        echo "⚠️  AWS CLI 未安装，将使用 AWS 控制台部署"
        echo "   请访问: https://console.aws.amazon.com/amplify/"
    fi
    
    echo "✅ 要求检查完成"
}

# 构建项目
build_project() {
    echo "🔨 构建项目..."
    
    # 安装依赖
    npm install
    
    # 构建生产版本
    npm run build
    
    echo "✅ 构建完成"
}

# 提交代码到 GitHub
commit_to_github() {
    echo "📝 提交代码到 GitHub..."
    
    # 检查是否有未提交的更改
    if [[ -n $(git status --porcelain) ]]; then
        echo "发现未提交的更改，正在提交..."
        git add .
        git commit -m "Deploy to AWS Amplify - $(date)"
    fi
    
    # 推送到 GitHub
    git push origin main
    
    echo "✅ 代码已推送到 GitHub"
}

# 使用 AWS CLI 部署
deploy_with_aws_cli() {
    echo "☁️  使用 AWS CLI 部署到 AWS Amplify..."
    
    # 检查 AWS 配置
    if ! aws sts get-caller-identity &> /dev/null; then
        echo "❌ AWS 凭证未配置，请运行 'aws configure'"
        exit 1
    fi
    
    # 部署 CloudFormation 堆栈
    aws cloudformation create-stack \
        --stack-name EPCOT-Amplify-Stack \
        --template-body file://epcot-amplify-template.yaml \
        --capabilities CAPABILITY_NAMED_IAM \
        --region us-east-1
    
    echo "✅ CloudFormation 堆栈创建中..."
    echo "   请等待 5-10 分钟完成部署"
    echo "   您可以在 AWS 控制台查看进度"
}

# 显示部署信息
show_deployment_info() {
    echo ""
    echo "🎉 部署信息"
    echo "================"
    echo "📁 GitHub 仓库: https://github.com/2JyinLogic/epcot-web"
    echo "☁️  AWS Amplify: https://console.aws.amazon.com/amplify/"
    echo "📖 部署文档: 查看 DEPLOYMENT.md"
    echo ""
    echo "📋 下一步:"
    echo "1. 访问 AWS Amplify 控制台"
    echo "2. 连接您的 GitHub 仓库"
    echo "3. 配置构建设置"
    echo "4. 部署应用"
    echo ""
    echo "🔗 有用的链接:"
    echo "- AWS Amplify 控制台: https://console.aws.amazon.com/amplify/"
    echo "- GitHub 仓库: https://github.com/2JyinLogic/epcot-web"
    echo "- 部署文档: DEPLOYMENT.md"
}

# 主函数
main() {
    echo "EPCOT Web 部署脚本"
    echo "=================="
    
    # 检查要求
    check_requirements
    
    # 构建项目
    build_project
    
    # 提交到 GitHub
    commit_to_github
    
    # 尝试使用 AWS CLI 部署
    if command -v aws &> /dev/null; then
        deploy_with_aws_cli
    else
        echo "📋 手动部署步骤:"
        echo "1. 访问 https://console.aws.amazon.com/amplify/"
        echo "2. 点击 'New app' → 'Host web app'"
        echo "3. 选择 GitHub 并授权"
        echo "4. 选择仓库: 2JyinLogic/epcot-web"
        echo "5. 配置构建设置并部署"
    fi
    
    # 显示部署信息
    show_deployment_info
}

# 运行主函数
main "$@" 