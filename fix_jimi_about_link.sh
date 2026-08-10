#!/bin/bash
set -e

echo "🔍 正在搜尋全站『吉米』與 about 頁面並強制更新連結..."

python3 -c "
import os, re

new_link = 'https://line.me/ti/p/27T97_JrES'
updated_files = []

for root, dirs, files in os.walk('src'):
    for file in files:
        if file.endswith(('.astro', '.jsx', '.tsx', '.vue', '.html', '.md')):
            path = os.path.join(root, file)
            with open(path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            if '吉米' in content or 'Jimi' in content or 'about' in path.lower():
                lines = content.split('\n')
                for i, l in enumerate(lines):
                    if '吉米' in l or 'Jimi' in l:
                        # 掃描前後 5 行，將其中的 href 全部替換為專屬 LINE 連結
                        for j in range(max(0, i-5), min(len(lines), i+6)):
                            if 'href=' in lines[j]:
                                lines[j] = re.sub(r'href=\"[^\"]*\"', f'href=\"{new_link}\"', lines[j])
                                lines[j] = re.sub(r\"href='[^']*'\", f\"href='{new_link}'\", lines[j])
                
                new_content = '\n'.join(lines)
                
                # 如果依然沒包覆到 <a> 標籤，強制將『吉米』或『Jimi』轉為超連結
                if new_link not in new_content and ('吉米' in new_content or 'Jimi' in new_content):
                    new_content = re.sub(
                        r'(<[^>]+>)?(吉米|Jimi)(</[^>]+>)?',
                        rf'<a href="{new_link}" target="_blank" rel="nofollow noreferrer" class="hover:underline text-cyan-400">\1\2\3</a>',
                        new_content,
                        count=1
                    )

                if new_content != content:
                    with open(path, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    updated_files.append(path)

print('✅ 成功更新檔案：', updated_files)
"

# 本地打包測試
npm run build

# Git 提交並自動推送至 GitHub
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Force update Jimi link on about page to personal LINE" || true
git push origin "$BRANCH"

echo "✨ 搞定！『吉米』的點擊連結已強制更正為你的專屬 LINE，並已成功推送發布！"
