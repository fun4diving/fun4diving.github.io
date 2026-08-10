#!/bin/bash
set -e

echo "🔍 正在檢查與修復 about.astro 中的吉米連結..."

TARGET_LINK="https://line.me/ti/p/27T97_JrES"

python3 -c "
import os, re

target_link = '$TARGET_LINK'
filepath = 'src/pages/about.astro'

if not os.path.exists(filepath):
    # 尋找包含 about 的 astro 檔案
    for root, dirs, files in os.walk('src'):
        for f in files:
            if 'about' in f.lower() and f.endswith('.astro'):
                filepath = os.path.join(root, f)
                break

print(f'📄 目標檔案：{filepath}')

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# 替換任何包含吉米或 Jimi 的 <a> 標籤 href
new_content = re.sub(
    r'(<a[^>]*?href=\")[^\"]*(\"[^>]*?>[\s\S]*?(?:吉米|Jimi)[\s\S]*?</a>)',
    rf'\g<1>{target_link}\g<2>',
    content,
    flags=re.IGNORECASE
)

# 如果還沒換成功，直接搜尋附近的 line 連結或預設 href 並進行更新
if new_content == content:
    lines = content.split('\n')
    for i, line in enumerate(lines):
        if '吉米' in line or 'Jimi' in line or 'jimi' in line:
            # 找前後 3 行內的 href
            for j in range(max(0, i-3), min(len(lines), i+4)):
                if 'href=' in lines[j]:
                    lines[j] = re.sub(r'href=\"[^\"]*\"', f'href=\"{target_link}\"', lines[j])
                    lines[j] = re.sub(r\"href='[^']*'\", f\"href='{target_link}'\", lines[j])
    new_content = '\n'.join(lines)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(new_content)

print('✅ 檔案更新成功！')
"

echo "📦 執行打包測試 npm run build..."
npm run build

echo "🚀 推送修改至 GitHub..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Force update Jimi link on about page to https://line.me/ti/p/27T97_JrES" || true
git push origin "$BRANCH"

echo "✨ 完成！『吉米』的 LINE 個人連結已正式強制更新並成功推送！"
