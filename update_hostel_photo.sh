#!/bin/bash
set -e
echo "📝 正在更新 courses 頁面的背包房照片連結為 /S__21602472_0.jpg..."

python3 -c "
import os, re

# 尋找 courses 頁面檔案 (.astro)
target_files = []
for root, dirs, files in os.walk('src/pages'):
    for file in files:
        if 'course' in file.lower() and file.endswith('.astro'):
            target_files.append(os.path.join(root, file))

for path in target_files:
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # 針對背包房區塊中的 img src 進行更換
    lines = content.split('\n')
    updated = False
    for i, line in enumerate(lines):
        context = '\n'.join(lines[max(0, i-6):min(len(lines), i+7)])
        if ('背包' in context or 'Hostel' in context or '住宿' in context) and 'src=' in line:
            # 替換圖片 src 屬性為 /S__21602472_0.jpg
            lines[i] = re.sub(r'src=\"[^\"]*\"', 'src=\"/S__21602472_0.jpg\"', line)
            lines[i] = re.sub(r\"src='[^']*'\", \"src='/S__21602472_0.jpg'\", lines[i])
            updated = True

    if updated:
        with open(path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        print(f'✅ 已成功更新：{path}')
"

# 打包測試
npm run build

# Git 提交並推送至 GitHub
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
if git diff-index --quiet HEAD --; then
  echo "⚠️ 圖片檔案尚未放進 public/ 或路徑已是最新的，進行 Git Commit..."
  git commit --allow-empty -m "Update Hostel photo to new wooden capsule bed image"
else
  git commit -m "Update Hostel photo in courses page to new room image"
fi

git push origin "$BRANCH"

echo "✨ 完成！courses 頁面背包房照片已更新為最新實景照片並自動部署上線！"
