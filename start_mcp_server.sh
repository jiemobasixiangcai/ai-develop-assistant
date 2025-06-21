#!/bin/bash
# MCP服务器启动脚本

echo "🚀 启动MCP AI开发助手服务器..."
cd "$(dirname "$0")"
source venv/bin/activate
export MCP_STORAGE_DIR="./mcp_data"
python AIDevlopStudy.py
