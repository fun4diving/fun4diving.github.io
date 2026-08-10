#!/bin/bash
set -e
echo "📝 正在更新『加入 LINE 社群』連結（包含首頁、Footer 以及 News 內頁）..."

python3 -c '
import os, re

NEW_COMMUNITY_URL = "https://line.me/ti/g2/0rGjqpJuPuLP2oemMK9mdojS2C2bE-vFuxwxBw?utm_source=invitation&utm_medium=link_copy&utm_campaign=default"

for root, dirs, files in os.walk("src"):
    for file in files:
        if file.endswith((".astro", ".md", ".mdx", ".json", ".ts", ".js")):
            path = os.path.join(root, file)
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()

            new_content = content

            # 如果是在 news 相關的內頁或資料夾，替換所有的舊 LINE 社群連結
            if "news" in path.lower():
                new_content = re.sub(r"https?://lin\.ee/lSvAOy4[^\s\"'\'>]*", NEW_COMMUNITY_URL, new_content)
                new_content = re.sub(r"https?://line\.me/ti/g2/[^\s\"'\'>]*", NEW_COMMUNITY_URL, new_content)

            # 針對所有頁面，精準捕捉與「LINE社群/社群」相關的按鈕連結進行更新
            lines = new_content.split("\n")
            updated_lines = []
            for i, line in enumerate(lines):
                context = "\n".join(lines[max(0, i-5):min(len(lines), i+6)])
                if ("社群" in context or "Community" in context or "news" in path.lower()) and "lin.ee/lSvAOy4" in line:
                    line = re.sub(r"https?://lin\.ee/lSvAOy4[^\s\"'\'>]*", NEW_COMMUNITY_URL, line)
                updated_lines.append(line)
            
            new_content = "\n".join(updated_lines)

            if new_content != content:
                with open(path, "w", encoding="utf-8") as f:
                    f.write(new_content)
                print(f"✅ 已成功更新連結：{path}")
'

# 本地打包測試
npm run build

# Git 提交並自動推送至 GitHub
git add . && git commit -m "Update LINE community link across website and news inner pages" && git push origin main

echo "✨ 完成！『加入 LINE 社群』連結（含 News 內頁）已成功更正並自動發布上線！"
