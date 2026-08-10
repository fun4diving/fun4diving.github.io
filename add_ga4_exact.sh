#!/bin/bash
set -e

echo "🔍 正在將 GA4 追蹤碼 (G-YMWYDJ7B62) 精準埋入 Layout.astro..."

python3 -c "
import os

path = 'src/layouts/Layout.astro'
ga_id = 'G-YMWYDJ7B62'

ga_snippet = '''    <!-- Google tag (gtag.js) -->
    <script async src=\"https://www.googletagmanager.com/gtag/js?id=G-YMWYDJ7B62\"></script>
    <script is:inline>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-YMWYDJ7B62');
    </script>'''

with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

if ga_id in content:
    print('ℹ️ GA4 追蹤碼已經存在於 Layout.astro 中！')
else:
    new_content = content.replace('</head>', f'{ga_snippet}\n  </head>')
    with open(path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print('✅ 成功將 GA4 追蹤碼埋入 </head> 標籤前！')
"

echo "----------------------------------------"
echo "📦 打包測試 npm run build..."
npm run build

echo "----------------------------------------"
echo "🚀 進行 Git Commit 與 Push..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Embed GA4 tracking code (G-YMWYDJ7B62) into Layout.astro" || git commit --allow-empty -m "Force deploy GA4 tracking script"
git push origin "$BRANCH"

echo "----------------------------------------"
echo "✨ 完成！GA4 追蹤碼已成功部署上線！約 1~2 分鐘後即可在 GA4 後台看見即時訪客數據。"
