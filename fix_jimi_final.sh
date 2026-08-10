#!/bin/bash
set -e

echo "🔍 1. 正在全站搜尋含有『吉米』或『Jimi』的檔案..."
FILES=$(grep -rl "吉米" src/ || grep -rl "Jimi" src/ || true)

if [ -z "$FILES" ]; then
  echo "⚠️ 在 src/ 裡找不到包含『吉米』的文字，擴大搜尋全專案..."
  FILES=$(grep -rl "吉米" . --exclude-dir={node_modules,.git,.astro,dist} || true)
fi

echo "📄 找到以下檔案："
echo "$FILES"

TARGET_LINK="https://line.me/ti/p/27T97_JrES"

python3 -c "
import sys, re

target = '$TARGET_LINK'
file_list = '''$FILES'''.strip().split('\n')

for path in file_list:
    path = path.strip()
    if not path: continue
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    lines = content.split('\n')
    updated = False
    
    for i, line in enumerate(lines):
        if '吉米' in line or 'Jimi' in line:
            # 掃描前後 5 行內的 href 屬性進行替換
            for j in range(max(0, i-5), min(len(lines), i+6)):
                if 'href=' in lines[j]:
                    lines[j] = re.sub(r'href=[\"\\\'][^\"\\\']*[\"\\\']', f'href=\"{target}\"', lines[j])
                    updated = True

    new_content = '\n'.join(lines)

    # 如果沒找到 href，直接把『吉米』字樣包成連結
    if not updated and ('吉米' in new_content or 'Jimi' in new_content):
        new_content = re.sub(
            r'(吉米|Jimi)',
            rf'<a href=\"{target}\" target=\"_blank\" rel=\"nofollow noreferrer\" class=\"text-cyan-400 hover:underline\">\1</a>',
            new_content,
            count=1
        )

    with open(path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f'✅ 已成功寫入新連結至：{path}')
"

echo "----------------------------------------"
echo "📊 2. Git 修改狀態（確認檔案是否有被變更）："
git status -s

echo "----------------------------------------"
echo "🔍 3. Git Diff 內容（顯示具體改了哪一行）："
git diff

echo "----------------------------------------"
echo "📦 4. 測試打包建置 npm run build..."
npm run build

echo "----------------------------------------"
echo "🚀 5. 推送變更至 GitHub..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Update Jimi personal LINE link to https://line.me/ti/p/27T97_JrES" || git commit --allow-empty -m "Force push Jimi link update"
git push origin "$BRANCH"

echo "----------------------------------------"
echo "✨ 推送完成！請查看上方是否有成功顯示 Git Push 訊息！"
