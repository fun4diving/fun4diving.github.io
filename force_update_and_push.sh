#!/bin/bash
set -e

echo "🔍 正在精確替換 LINE 社群連結..."

NEW_URL="https://line.me/ti/g2/0rGjqpJuPuLP2oemMK9mdojS2C2bE-vFuxwxBw?utm_source=invitation&utm_medium=link_copy&utm_campaign=default"

# 1. 替換 index.astro 中最新消息卡片的社群連結
python3 -c "
import re

new_url = '$NEW_URL'

# 更新 index.astro
with open('src/pages/index.astro', 'r', encoding='utf-8') as f:
    content = f.read()

# 替換最新消息區塊裡的 LINE 社群按鈕連結
pattern = r'(加入 Line 社群優惠 ↗[\s\S]*?href=\")http://lin\.ee/lSvAOy4'
if 'lin.ee/lSvAOy4' in content:
    # 針對含有「加入 Line 社群」附近的 href 做精準替換
    lines = content.split('\n')
    for i, l in enumerate(lines):
        if '加入 Line 社群' in l or '加入Line社群' in l:
            # 找前後 5 行內的 href
            for j in range(max(0, i-5), min(len(lines), i+6)):
                if 'lin.ee/lSvAOy4' in lines[j]:
                    lines[j] = lines[j].replace('http://lin.ee/lSvAOy4', new_url).replace('https://lin.ee/lSvAOy4', new_url)
    content = '\n'.join(lines)

with open('src/pages/index.astro', 'w', encoding='utf-8') as f:
    f.write(content)
print('✅ index.astro 替代完成')
"

# 2. 替換 news 相關頁面或目錄內所有檔案的舊 LINE 連結
python3 -c "
import os, re

new_url = '$NEW_URL'

for root, dirs, files in os.walk('src'):
    for file in files:
        path = os.path.join(root, file)
        if 'news' in path.lower():
            with open(path, 'r', encoding='utf-8') as f:
                c = f.read()
            c_new = re.sub(r'https?://lin\.ee/lSvAOy4', new_url, c)
            if c_new != c:
                with open(path, 'w', encoding='utf-8') as f:
                    f.write(c_new)
                print(f'✅ 已更新內頁：{path}')
"

echo "📦 正在測試打包 npm run build..."
npm run build

echo "📊 當前 Git 異動狀態："
git status -s

echo "🚀 進行 Git Commit 與 Push..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
if git diff-index --quiet HEAD --; then
  echo "⚠️ 檔案未發生變化，強制觸發 Commit..."
  git commit --allow-empty -m "Trigger manual rebuild and link update"
else
  git commit -m "Update LINE community links in index news section and news pages"
fi

git push origin "$BRANCH"

echo "✨ 成功！連結已更新並順利推送至 GitHub ($BRANCH)！"
