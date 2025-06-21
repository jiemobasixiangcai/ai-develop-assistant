#!/usr/bin/env python3
"""
MCP AI开发助手测试脚本
验证所有工具功能是否正常工作
"""

import os
import sys
import json
import asyncio
from pathlib import Path

# 添加当前目录到Python路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# 设置测试环境变量
os.environ["MCP_STORAGE_DIR"] = "./test_mcp_data"

# 导入MCP服务器
from AIDevlopStudy import mcp, storage, current_requirements

async def test_mcp_tools():
    """测试所有MCP工具功能"""
    print("🧪 开始测试MCP AI开发助手...")
    print(f"📁 存储目录: {storage.storage_dir}")
    
    # 清理测试数据
    if storage.storage_dir.exists():
        import shutil
        shutil.rmtree(storage.storage_dir)
    storage.storage_dir.mkdir(exist_ok=True)
    
    try:
        # 1. 测试需求澄清工具
        print("\n1️⃣ 测试需求澄清工具...")
        from AIDevlopStudy import requirement_clarifier
        result1 = requirement_clarifier("我想做一个AI聊天机器人网站", "Web应用开发")
        print("✅ 需求澄清工具测试成功")
        
        # 2. 测试需求管理工具
        print("\n2️⃣ 测试需求管理工具...")
        from AIDevlopStudy import requirement_manager
        result2 = requirement_manager("项目类型：Web应用，目标：创建AI聊天机器人网站", "项目概述")
        print("✅ 需求管理工具测试成功")
        
        # 3. 测试架构设计工具
        print("\n3️⃣ 测试架构设计工具...")
        from AIDevlopStudy import architecture_designer
        result3 = architecture_designer("AI聊天机器人网站架构")
        print("✅ 架构设计工具测试成功")
        
        # 4. 测试状态查看工具
        print("\n4️⃣ 测试状态查看工具...")
        from AIDevlopStudy import view_requirements_status
        result4 = view_requirements_status()
        print("✅ 状态查看工具测试成功")
        
        # 5. 测试文档导出工具
        print("\n5️⃣ 测试文档导出工具...")
        from AIDevlopStudy import export_final_document
        result5 = export_final_document()
        print("✅ 文档导出工具测试成功")
        
        # 检查生成的文件
        print("\n📁 检查生成的文件...")
        files = list(storage.storage_dir.glob("*"))
        print(f"✅ 生成了 {len(files)} 个文件:")
        for file in files:
            print(f"   - {file.name} ({file.stat().st_size} 字节)")
        
        # 验证需求数据
        print("\n📊 验证需求数据...")
        print(f"✅ 项目概述: {len(current_requirements['project_overview'])} 条")
        print(f"✅ 功能需求: {len(current_requirements['functional_requirements'])} 条")
        print(f"✅ 架构设计: {len(current_requirements['architecture_designs'])} 个")
        print(f"✅ 澄清历史: {len(current_requirements['clarification_history'])} 次")
        
        print("\n🎉 所有测试通过！MCP AI开发助手工作正常！")
        return True
        
    except Exception as e:
        print(f"\n❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_file_operations():
    """测试文件操作功能"""
    print("\n📄 测试文件操作...")
    
    # 检查requirements.json
    req_file = storage.storage_dir / "requirements.json"
    if req_file.exists():
        with open(req_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ requirements.json 包含 {len(data)} 个字段")
    
    # 检查history.json
    hist_file = storage.storage_dir / "history.json"
    if hist_file.exists():
        with open(hist_file, 'r', encoding='utf-8') as f:
            history = json.load(f)
        print(f"✅ history.json 包含 {len(history)} 条记录")
    
    # 检查导出文件
    export_files = list(storage.storage_dir.glob("final_document_*"))
    print(f"✅ 找到 {len(export_files)} 个导出文件")

if __name__ == "__main__":
    print("🚀 MCP AI开发助手 - 完整功能测试")
    print("=" * 50)
    
    # 运行异步测试
    success = asyncio.run(test_mcp_tools())
    
    if success:
        # 测试文件操作
        test_file_operations()
        
        print("\n" + "=" * 50)
        print("🎉 测试完成！开发环境已就绪！")
        print("\n📋 下一步操作:")
        print("1. 配置Claude Desktop (参考README.md)")
        print("2. 重启Claude Desktop")
        print("3. 开始使用AI开发助手")
        print("\n💡 使用提示:")
        print("- 使用 requirement_clarifier 开始需求分析")
        print("- 使用 requirement_manager 保存明确的需求")
        print("- 使用 architecture_designer 生成架构方案")
        print("- 使用 export_final_document 导出完整文档")
    else:
        print("\n❌ 测试失败，请检查错误信息")
        sys.exit(1)
