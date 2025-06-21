#!/bin/bash
# 开发测试脚本

echo "🧪 运行开发测试..."
cd "$(dirname "$0")"
source venv/bin/activate
export MCP_STORAGE_DIR="./test_mcp_data"
python test_mcp_server.py
