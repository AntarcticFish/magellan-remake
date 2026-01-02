import os
import time
import json
import glob
import requests
from pathlib import Path

# 配置部分
# 自动寻找 DST 存档目录 (Windows)
USER_DOCUMENTS = os.path.join(os.path.expanduser("~"), "Documents")
DST_DATA_PATH = os.path.join(USER_DOCUMENTS, "Klei", "DoNotStarveTogether")

# 通信文件名
REQUEST_FILE = "mgl_ai_request"
RESPONSE_FILE = "mgl_ai_response"

def find_request_file():
    """
    在所有可能的存档路径中寻找请求文件
    通常路径: Documents/Klei/DoNotStarveTogether/<SteamID>/client_save/mgl_ai_request
    """
    # 搜索模式：匹配所有用户ID文件夹下的 client_save
    search_pattern = os.path.join(DST_DATA_PATH, "*", "client_save", REQUEST_FILE)
    files = glob.glob(search_pattern)
    
    if not files:
        return None
        
    # 如果有多个，返回修改时间最近的那个
    return max(files, key=os.path.getmtime)

def process_request(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        if not content.strip():
            return
            
        # DST 有时候会写入一些非 JSON 的头部信息，或者文件可能为空
        # 比如: "KLEI     1 {"...
        try:
            # 尝试找到第一个 '{'
            json_start = content.find('{')
            if json_start != -1:
                content = content[json_start:]
                data = json.loads(content)
            else:
                # 如果找不到 '{'，可能不是 JSON 或者加密了，尝试直接解析
                data = json.loads(content)
        except json.JSONDecodeError:
            print(f"[-] 无法解析 JSON: {content[:50]}...")
            return

        print(f"[+] 收到请求: {data.get('messages', [])[-1].get('content', 'Unknown')}")
        
        # 提取 API 配置
        api_url = data.get('api_url')
        api_key = data.get('api_key')
        model = data.get('model', 'gpt-3.5-turbo')
        messages = data.get('messages')
        
        if not api_url or not api_key:
            print("[-] 缺少 API URL 或 Key")
            return

        # 发送请求
        headers = {
            "Content-Type": "application/json",
            "Authorization": f"Bearer {api_key}"
        }
        
        payload = {
            "model": model,
            "messages": messages
        }
        
        print(f"[*] 发送请求到 {api_url}...")
        response = requests.post(api_url, headers=headers, json=payload, timeout=30)
        
        # 准备响应
        response_data = None
        if response.status_code == 200:
            print("[+] 请求成功")
            response_data = response.text # 保持原始 JSON 字符串
        else:
            print(f"[-] 请求失败: {response.status_code}")
            response_data = json.dumps({
                "error": True,
                "code": response.status_code,
                "message": response.text
            })

        # 写入响应文件
        # 响应文件应该在同一个目录下
        response_file_path = os.path.join(os.path.dirname(file_path), RESPONSE_FILE)
        with open(response_file_path, 'w', encoding='utf-8') as f:
            f.write(response_data)
            
        # 清空请求文件，防止重复处理
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write("")
            
    except Exception as e:
        print(f"[-] 处理出错: {e}")

def main():
    print("=== DST AI 助手外部桥接程序 ===")
    print("正在监听请求文件...")
    print(f"搜索路径: {DST_DATA_PATH}")
    
    last_file = None
    
    while True:
        request_file = find_request_file()
        
        if request_file:
            if request_file != last_file:
                print(f"[+] 找到请求文件: {request_file}")
                last_file = request_file
                
            # 检查文件是否有内容
            try:
                if os.path.getsize(request_file) > 0:
                    process_request(request_file)
            except OSError:
                pass
        
        time.sleep(1)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n程序已停止")
