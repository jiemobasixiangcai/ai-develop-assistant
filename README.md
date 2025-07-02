# 🚀 MCP AI开发助手 - 智能需求分析与架构设计

> 协助AI开发者进行智能化需求完善、模块设计、技术架构设计的MCP工具

## ✨ 核心特性

### 🧠 智能分支感知系统
- **分支识别**: 自动识别当前讨论的需求分支（项目目标、功能设计、技术偏好、UI设计）
- **记忆保持**: 防止AI在多轮对话中遗忘未完成的需求维度
- **渐进式澄清**: 确保所有核心需求分支都得到充分讨论
- **智能提醒**: 自动提醒未完成的需求分支，防止遗漏

### 🤖 AI自主设计与控制
- **用户授权检测**: 识别"常规设计"、"标准方案"等用户授权AI自主设计的表达
- **分支式设计**: 仅对当前分支进行自主设计，不会跳跃到其他未讨论的分支
- **完整性门控**: 只有所有核心分支完成后才允许进入架构设计阶段
- **AI自我评估**: AI主动评估自己对需求的理解深度，不足时拒绝架构设计

### 🔧 核心工具 (5个)
1. **requirement_clarifier** - 智能需求澄清助手 🧠
   - 项目特征识别与分析
   - 分支感知的高质量问题生成
   - 避免技术假设，强制澄清实现偏好

2. **requirement_manager** - 智能需求管理器 📋
   - 自动分类与重复检测
   - 需求完整性验证
   - 智能下一步建议

3. **architecture_designer** - 定制化架构设计器 🏗️
   - 基于需求特征的技术栈推荐
   - 智能模块结构生成
   - 风险识别与实施建议

4. **view_requirements_status** - 需求状态查看器 📊
   - 分支完成度实时监控
   - 需求内容预览
   - 智能进度建议

5. **export_final_document** - 文档导出工具 📄
   - JSON + Markdown双格式导出
   - 完整项目文档生成

### 💾 持久化存储特性
- ✅ **自动保存**: 每次操作都会自动保存到文件
- ✅ **历史记录**: 完整的操作历史追溯
- ✅ **多格式导出**: JSON + Markdown双格式
- ✅ **自定义目录**: 支持环境变量配置存储位置
- ✅ **分支状态**: 持久化跟踪各需求分支完成状态

## 📁 配置方法

### 远程直连（推荐）将MCP_STORAGE_DIR替换为你的本地目录后复制配置粘贴到工具中即可
   ```json
   {
      "mcpServers": {
         "ai-develop-assistant": {
            "command": "uvx",
            "args": ["ai-develop-assistant@latest"],
            "env": {
            "MCP_STORAGE_DIR": "/path/to/your/storage"
            }
         }
      }
   }
   ```

### 本地部署 方法1: Claude Desktop配置 (推荐)

1. **找到配置文件位置**
   ```
   Windows: %APPDATA%\Claude\claude_desktop_config.json
   macOS: ~/Library/Application Support/Claude/claude_desktop_config.json
   Linux: ~/.config/claude/claude_desktop_config.json
   ```

2. **本地部署配置内容**
   ```json
   {
     "mcpServers": {
       "ai-develop-assistant": {
         "command": "python",
         "args": [
           "path\AIDevlopStudy.py"
         ],
         "env": {
           "MCP_STORAGE_DIR": "your save path"
         }
       }
     }
   }
   ```

3. **重启Claude Desktop**

### 方法2: 环境变量配置

创建 `.env` 文件：
```bash
# 自定义存储目录
MCP_STORAGE_DIR=./mcp_data

# 或者设置为其他路径
# MCP_STORAGE_DIR=D:/MyProjects/mcp_storage
```

## 📊 存储结构

配置成功后，会在指定目录生成以下文件：

```
mcp_data/
├── requirements.json      # 实时需求文档
├── history.json          # 操作历史记录
├── final_document_*.json # 导出的完整文档
└── final_document_*.md   # Markdown格式报告
```

## 🎯 智能化使用流程

### 分支感知的渐进式需求分析

#### 第一阶段：智能需求澄清 🧠
```
requirement_clarifier("我要做一个在线教育平台")
```
**AI会智能分析**：
- 识别项目类型和复杂度
- 生成针对性的澄清问题
- 避免技术假设，澄清实现偏好

#### 第二阶段：分支式需求管理 🌿
```
# 项目目标分支
requirement_manager("目标用户：学生和教师，核心价值：便捷学习", "项目概述")

# 功能设计分支
requirement_clarifier("功能设计用常规的就好") # AI会自主设计功能分支
requirement_manager("核心功能：视频播放、在线测试...", "功能需求")

# 技术偏好分支
requirement_clarifier("技术选型有什么建议？")
requirement_manager("技术栈：React + Node.js + MySQL", "技术需求")

# UI设计分支
requirement_manager("UI风格：简洁现代，响应式布局", "设计需求")
```

#### 第三阶段：完整性检查 📊
```
view_requirements_status()
```
**系统会显示**：
- 各分支完成状态
- 完成度百分比
- 下一步建议

#### 第四阶段：智能架构设计 🏗️
```
architecture_designer("在线教育平台架构")
```
**只有在所有核心分支完成且AI确信理解充分时才会生成架构**

#### 第五阶段：文档导出 📄
```
export_final_document()
```

### 🔄 智能特性演示

#### 场景1：防止AI遗忘
```
用户：先讨论功能设计
AI：[详细讨论功能设计]
用户：功能就这样吧，开始架构设计
AI：⚠️ 还有技术偏好、UI设计等分支未讨论，建议先完善这些需求
```

#### 场景2：用户授权AI自主设计
```
用户：UI设计就用常规的现代风格就好
AI：✅ 为UI设计分支生成标准现代风格方案
    ⏳ 还需完成：技术偏好分支
    📋 建议继续澄清技术选型偏好
```

#### 场景3：AI自我评估
```
用户：开始架构设计吧
AI：❌ 我对当前需求的理解还不够深入（置信度：60%）
    📋 建议补充：具体的性能要求、集成需求
```

## 🧪 快速测试

### 验证智能功能
```python
# 在Claude Desktop中测试
requirement_clarifier("我想做一个AI聊天机器人网站")

# 预期：AI会智能分析项目特征，生成高质量澄清问题
# 而不是机械式的模板问题
```

### 测试分支感知
```python
# 测试用户授权AI自主设计
requirement_clarifier("功能设计就用常规的就好", "功能设计讨论")

# 预期：AI只设计功能分支，然后提醒其他未完成分支
```

### 测试完整性门控
```python
# 在需求不完整时尝试架构设计
architecture_designer("测试架构")

# 预期：AI拒绝设计并说明缺失的需求分支
```

## 💡 使用技巧

### 1. 项目开始前
- 设置好 `MCP_STORAGE_DIR` 环境变量
- 确保目录有写入权限

### 2. 需求分析中
- 定期使用 `view_requirements_status` 查看进度
- 每次澄清后都会自动保存

### 3. 项目完成后
- 使用 `export_final_document` 导出完整文档
- Markdown文件可作为项目README基础

### 4. 多项目管理
- 为不同项目设置不同的存储目录
- 使用项目名称作为目录名

## 🔍 故障排除

### 常见问题

1. **存储目录权限问题**
   ```bash
   # 确保目录可写
   mkdir -p ./mcp_data
   chmod 755 ./mcp_data
   ```

2. **环境变量未生效**
   ```bash
   # 检查环境变量
   echo $MCP_STORAGE_DIR
   
   # 重新设置
   export MCP_STORAGE_DIR="./mcp_data"
   ```

3. **文件编码问题**
   - 所有文件使用UTF-8编码
   - 支持中文内容

## 🎉 核心优势

### 🧠 智能化升级
- ✅ **分支感知**: AI始终知道当前讨论的需求分支，不会遗忘
- ✅ **记忆保持**: 多轮对话中保持对所有需求维度的跟踪
- ✅ **智能澄清**: 基于项目特征生成高质量问题，避免无效提问
- ✅ **自主设计**: 用户授权时智能设计当前分支，不过度自动化
- ✅ **完整性门控**: 确保所有核心需求完成后才进入架构设计

### 🔧 技术特性
- ✅ **数据持久化**: 不再丢失分析结果
- ✅ **历史追溯**: 完整的操作记录
- ✅ **文档导出**: 自动生成项目文档
- ✅ **状态查看**: 实时了解分析进度
- ✅ **配置灵活**: 自定义存储位置

### 💡 实际价值
- 🎯 **沟通成本降低**: 高质量问题，避免重复澄清
- 🧠 **需求完整性**: 确保所有重要方面都被考虑
- 🚀 **开发效率**: 基于充分需求生成精准架构
- 📋 **文档完整**: 自动生成完整项目文档
- 💾 **数据安全**: 本地存储，隐私保护

## 🚀 开始使用

### 快速上手
1. **配置Claude Desktop** (参考上面的配置方法)
2. **重启Claude Desktop**
3. **开始智能需求分析**：
   ```
   requirement_clarifier("描述你的项目想法")
   ```
4. **跟随AI的智能引导**，逐步完善各个需求分支
5. **导出完整文档**：
   ```
   export_final_document()
   ```

### 最佳实践
- 💬 **信任AI的分支管理**：让AI引导你完成所有需求分支
- 🎯 **明确表达偏好**：对技术选型、UI风格等明确表达偏好
- 📊 **定期查看状态**：使用 `view_requirements_status` 了解进度
- 🤖 **适当授权AI**：对不确定的部分可以说"用常规方案"

---

**🎯 现在您拥有了一个真正智能的AI开发助手，它会记住每个细节，引导您完成完整的需求分析！**

