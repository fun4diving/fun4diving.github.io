#!/bin/bash
set -e
echo "📝 正在更新 about 頁面中『吉米』的點擊連結為 LINE 個人帳號..."

python3 -c "
import os, re

NEW_LINK = 'https://line.me/ti/p/27T97_JrES'

target_files = []
for root, dirs, files in os.walk('src'):
    for file in files:
        if 'about' in file.lower() and file.endswith(('.astro', '.html', '.tsx', '.jsx', '.vue')):
            target_files.append(os.path.join(root, file))

for path in target_files:
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    lines = content.split('\n')
    updated = False
    for i, line in enumerate(lines):
        context = '\n'.join(lines[max(0, i-5):min(len(lines), i+6)])
        if ('吉米' in context or 'Jimi' in context or 'jimi' in context) and ('href=' in line or '<a' in line):
            lines[i] = re.sub(r'href=\"[^\"]*\"', f'href=\"{NEW_LINK}\"', lines[i])
            lines[i] = re.sub(r\"href='[^']*'\", f\"href='{NEW_LINK}'\", lines[i])
            updated = True

    if updated:
        with open(path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        print(f'✅ 已成功更新：{path}')
    else:
        # 如果沒找到 href，嘗試直接替換吉米文字外層的 a 標籤
        if '吉米' in content or 'Jimi' in content:
            content_updated = re.sub(r'(<a[^>]*href=\")[^\"]*(\"[^>]*>[\s\S]*?(?:吉米|Jimi)[\s\S]*?</a>)', rf'\g<1>{NEW_LINK}\g<2>', content, flags=re.IGNORECASE)
            if content_updated != content:
                with open(path, 'w', encoding='utf-8') as f:
                    f.write(content_updated)
                print(f'✅ 已成功替換標籤：{path}')
"

# 打包測試
npm run build

# Git 提交與推送
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
if git diff-index --quiet HEAD --; then
  echo "⚠️ 連結已是最新狀態，強制觸發 Commit..."
  git commit --allow-empty -m "Update Jimi direct LINE link on about page"
else
  git commit -m "Update Jimi link on about page to point to personal LINE account"
fi

git push origin "$BRANCH"

echo "✨ 完成！about 頁面中『吉米』的點擊連結已更新為專屬 LINE 帳號，並已自動發布上線！"
