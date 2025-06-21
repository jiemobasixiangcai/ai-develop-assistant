#!/bin/bash

# MCP AI开发助手 - 开发环境配置脚本
# 自动配置开发环境和Claude Desktop集成

set -e  # 遇到错误立即退出

echo "🚀 MCP AI开发助手 - 开发环境配置"
echo "=================================="

# 检查Python版本
echo "🐍 检查Python环境..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 未安装，请先安装Python 3.8+"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1,2)
echo "✅ Python版本: $PYTHON_VERSION"

# 获取当前目录
CURRENT_DIR=$(pwd)
echo "📁 项目目录: $CURRENT_DIR"

# 检查虚拟环境
if [ ! -d "venv" ]; then
    echo "📦 创建虚拟环境..."
    if command -v virtualenv &> /dev/null; then
        virtualenv venv
    else
        python3 -m venv venv
    fi
    echo "✅ 虚拟环境创建成功"
else
    echo "✅ 虚拟环境已存在"
fi

# 激活虚拟环境并安装依赖
echo "📦 安装依赖包..."
source venv/bin/activate
pip install -r requirements.txt
echo "✅ 依赖包安装完成"

# 运行测试
echo "🧪 运行功能测试..."
python test_mcp_server.py
echo "✅ 功能测试通过"

# 创建存储目录
echo "📁 创建存储目录..."
mkdir -p mcp_data
echo "✅ 存储目录创建完成"

# 检测操作系统并提供Claude Desktop配置指导
echo ""
echo "🔧 Claude Desktop配置指导"
echo "========================="

# 检测操作系统
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    CONFIG_PATH="~/.config/claude/claude_desktop_config.json"
    OS_NAME="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONFIG_PATH="~/Library/Application Support/Claude/claude_desktop_config.json"
    OS_NAME="macOS"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    CONFIG_PATH="%APPDATA%\\Claude\\claude_desktop_config.json"
    OS_NAME="Windows"
else
    CONFIG_PATH="请查看README.md获取配置路径"
    OS_NAME="未知系统"
fi

echo "🖥️  操作系统: $OS_NAME"
echo "📄 配置文件路径: $CONFIG_PATH"

# 生成配置内容
echo ""
echo "📝 Claude Desktop配置内容:"
echo "{"
echo "  \"mcpServers\": {"
echo "    \"ai-develop-assistant\": {"
echo "      \"command\": \"python\","
echo "      \"args\": ["
echo "        \"$CURRENT_DIR/AIDevlopStudy.py\""
echo "      ],"
echo "      \"env\": {"
echo "        \"MCP_STORAGE_DIR\": \"$CURRENT_DIR/mcp_data\""
echo "      }"
echo "    }"
echo "  }"
echo "}"

# 创建配置文件模板
echo ""
echo "💾 创建配置文件模板..."
cat > claude_desktop_config.json << EOF
{
  "mcpServers": {
    "ai-develop-assistant": {
      "command": "python",
      "args": [
        "$CURRENT_DIR/AIDevlopStudy.py"
      ],
      "env": {
        "MCP_STORAGE_DIR": "$CURRENT_DIR/mcp_data"
      }
    }
  }
}
EOF
echo "✅ 配置文件模板已保存为: claude_desktop_config.json"

# 创建启动脚本
echo ""
echo "🚀 创建启动脚本..."
cat > start_mcp_server.sh << 'EOF'
#!/bin/bash
# MCP服务器启动脚本

echo "🚀 启动MCP AI开发助手服务器..."
cd "$(dirname "$0")"
source venv/bin/activate
export MCP_STORAGE_DIR="./mcp_data"
python AIDevlopStudy.py
EOF

chmod +x start_mcp_server.sh
echo "✅ 启动脚本已创建: start_mcp_server.sh"

# 创建开发脚本
cat > dev_test.sh << 'EOF'
#!/bin/bash
# 开发测试脚本

echo "🧪 运行开发测试..."
cd "$(dirname "$0")"
source venv/bin/activate
export MCP_STORAGE_DIR="./test_mcp_data"
python test_mcp_server.py
EOF

chmod +x dev_test.sh
echo "✅ 开发测试脚本已创建: dev_test.sh"

echo ""
echo "🎉 开发环境配置完成！"
echo "===================="
echo ""
echo "📋 下一步操作:"
echo "1. 将配置内容复制到Claude Desktop配置文件"
echo "2. 重启Claude Desktop应用"
echo "3. 在Claude Desktop中测试MCP工具"
echo ""
echo "🛠️  可用脚本:"
echo "- ./start_mcp_server.sh  # 启动MCP服务器"
echo "- ./dev_test.sh          # 运行开发测试"
echo ""
echo "📁 重要文件:"
echo "- claude_desktop_config.json  # Claude Desktop配置模板"
echo "- mcp_data/                    # 数据存储目录"
echo "- test_mcp_data/              # 测试数据目录"
echo ""
echo "💡 使用提示:"
echo "配置完成后，在Claude Desktop中可以使用以下工具:"
echo "- requirement_clarifier    # 需求澄清助手"
echo "- requirement_manager      # 需求文档管理器"
echo "- architecture_designer    # 架构设计生成器"
echo "- view_requirements_status # 查看需求状态"
echo "- export_final_document    # 导出完整文档"
echo ""
echo "🎯 开始您的AI开发之旅吧！"
