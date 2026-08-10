#!/bin/bash
set -e

echo "🔍 正在搜尋並修正 about 頁面中的『吉米』個人 LINE 連結..."

python3 -c "
import os, re

target_link = 'https://line.me/ti/p/27T97_JrES'
found = False

# 遍歷 src 目錄
for root, dirs, files in os.walk('src'):
    for file in files:
        if file.endswith('.astro'):
            path = os.path.join(root, file)
            with open(path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # 找到含有 吉米 或 Jimi 的頁面
            if '吉米' in content or 'Jimi' in content or 'about' in path.lower():
                lines = content.split('\n')
                new_lines = []
                for i, line in enumerate(lines):
                    # 如果這行含有吉米/Jimi
                    if '吉米' in line or 'Jimi' in line or 'jimi' in line:
                        # 檢查前後 3 行內是否有 href
                        for j in range(max(0, i-3), min(len(lines), i+4)):
                            if 'href=' in lines[j]:
                                lines[j] = re.sub(r'href=[\"\\\'][^\"\\\']*[\"\\\']', f'href=\"{target_link}\"', lines[j])
                                found = True
                    new_lines.append(line)
                
                new_content = '\n'.join(new_lines)
                
                # 若沒找到 href 標籤，直接把『吉米』字樣包成帶有超連結的 a 標籤
                if not found and ('吉米' in new_content or 'Jimi' in new_content):
                    new_content = re.sub(
                        r'(吉米|Jimi)',
                        rf'<a href=\"{target_link}\" target=\"_blank\" rel=\"nofollow noreferrer\" class=\"text-cyan-400 hover:underline\">\1</a>',
                        new_content,
                        count=1
                    )
                    found = True

                if new_content != content:
                    with open(path, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f'✅ 已成功寫入新連結至：{path}')

if not found:
    print('⚠️ 未能自動定位，請確認 about 頁面檔案路徑。')
"

echo "📦 執行打包測試 npm run build..."
npm run build

echo "📊 檢查 Git 修改狀態："
git status -s

echo "🚀 進行 Git Commit 與 Push..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Update Jimi personal LINE link on about page" || git commit --allow-empty -m "Trigger deployment for Jimi link"
git push origin "$BRANCH"

echo "✨ 完成！請至 GitHub Pages 或回到網站刷新查看！"
