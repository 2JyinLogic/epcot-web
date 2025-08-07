# EPCOT Web 部署指南

## 概述
本指南将帮助您使用 AWS Amplify 部署 EPCOT Web 应用程序。

## 前置条件

### 1. AWS 账户
- 确保您有 AWS 账户
- 确保您有足够的权限创建 Amplify 应用和 IAM 角色

### 2. GitHub 仓库
- 确保您的代码已经推送到 GitHub 仓库：`https://github.com/2JyinLogic/epcot-web.git`
- 确保 GitHub token 有效且有足够权限

### 3. 本地代码准备
```bash
# 确保代码已提交到 GitHub
git add .
git commit -m "Initial commit for AWS deployment"
git push origin main
```

## 部署步骤

### 方法 1：使用 AWS CloudFormation 控制台

1. **登录 AWS 控制台**
   - 访问 [AWS CloudFormation 控制台](https://console.aws.amazon.com/cloudformation/)

2. **创建堆栈**
   - 点击 "Create stack" → "With new resources"
   - 选择 "Upload a template file"
   - 上传 `epcot-amplify-template.yaml` 文件

3. **配置堆栈**
   - 堆栈名称：`EPCOT-Amplify-Stack`
   - 其他参数保持默认

4. **部署**
   - 点击 "Create stack"
   - 等待部署完成（约 5-10 分钟）

### 方法 2：使用 AWS CLI

```bash
# 安装 AWS CLI（如果尚未安装）
# macOS: brew install awscli
# 或从 https://aws.amazon.com/cli/ 下载

# 配置 AWS 凭证
aws configure

# 部署 CloudFormation 堆栈
aws cloudformation create-stack \
  --stack-name EPCOT-Amplify-Stack \
  --template-body file://epcot-amplify-template.yaml \
  --capabilities CAPABILITY_NAMED_IAM
```

### 方法 3：使用 AWS Amplify 控制台（推荐）

1. **访问 Amplify 控制台**
   - 访问 [AWS Amplify 控制台](https://console.aws.amazon.com/amplify/)

2. **创建新应用**
   - 点击 "New app" → "Host web app"
   - 选择 "GitHub" 作为代码源

3. **连接 GitHub**
   - 授权 AWS Amplify 访问您的 GitHub 账户
   - 选择仓库：`2JyinLogic/epcot-web`

4. **配置构建设置**
   - 分支：`main`
   - 构建设置：
     ```yaml
     version: 1
     frontend:
       phases:
         preBuild:
           commands:
             - npm install
         build:
           commands:
             - npm run build
       artifacts:
         baseDirectory: dist
         files:
           - '**/*'
       cache:
         paths:
           - node_modules/**/*
     ```

5. **部署**
   - 点击 "Save and deploy"
   - 等待构建完成

## 部署后配置

### 1. 获取应用 URL
部署完成后，您可以通过以下方式获取应用 URL：
- AWS Amplify 控制台中的应用概览页面
- CloudFormation 输出中的 `EPCOTAmplifyAppURL`

### 2. 自定义域名（可选）
如果您有自定义域名：

1. **在 CloudFormation 模板中启用域名配置**
   ```yaml
   EPCOTDomain:
     Type: AWS::Amplify::Domain
     Properties:
       AppId: !GetAtt EPCOTAmplifyApp.AppId
       DomainName: your-domain.com
       SubDomainSettings:
         - Prefix: 'dev'
           BranchName: !GetAtt EPCOTDevelopmentBranch.BranchName
         - Prefix: ''
           BranchName: !GetAtt EPCOTProductionBranch.BranchName
   ```

2. **配置 DNS**
   - 将域名的 DNS 记录指向 AWS Amplify 提供的 CNAME

### 3. 环境变量配置
在 Amplify 控制台中配置环境变量：
- `NODE_ENV`: `production` (生产环境) 或 `development` (开发环境)

## 持续部署

### 自动部署
- 当您推送代码到 `main` 分支时，生产环境会自动重新部署
- 当您推送代码到 `develop` 分支时，开发环境会自动重新部署

### 手动部署
在 Amplify 控制台中：
1. 选择应用
2. 选择分支
3. 点击 "Redeploy this version"

## 监控和日志

### 查看构建日志
1. 在 Amplify 控制台中选择应用
2. 选择分支
3. 点击构建记录查看详细日志

### 应用监控
- 在 Amplify 控制台中查看应用性能指标
- 设置 CloudWatch 告警

## 故障排除

### 常见问题

1. **构建失败**
   - 检查 `package.json` 中的依赖是否正确
   - 确保所有依赖都已安装
   - 检查构建命令是否正确

2. **GitHub 连接问题**
   - 确保 GitHub token 有效
   - 检查仓库权限

3. **域名配置问题**
   - 确保 DNS 记录正确配置
   - 等待 DNS 传播（可能需要 24-48 小时）

### 获取帮助
- AWS Amplify 文档：https://docs.aws.amazon.com/amplify/
- AWS 支持：https://aws.amazon.com/support/

## 安全注意事项

1. **GitHub Token 安全**
   - 定期轮换 GitHub token
   - 使用最小权限原则
   - 不要在代码中硬编码 token

2. **IAM 权限**
   - 定期审查 IAM 角色权限
   - 使用最小权限原则

3. **HTTPS 配置**
   - 确保所有流量都通过 HTTPS
   - 配置适当的 CSP 头

## 成本优化

1. **资源清理**
   - 定期清理未使用的构建缓存
   - 删除不需要的分支

2. **监控成本**
   - 设置 AWS 成本告警
   - 定期审查资源使用情况

---

**注意**：请确保在生产环境中使用前测试所有配置，并遵循 AWS 最佳实践。 