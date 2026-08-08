#!/bin/bash
set -e

echo "🔨 1. 本地靜態導出 Tina Schema..."
npx tinacms build --local

echo "📂 2. 強制解除 .gitignore 對 __generated__ 的忽略..."
if [ -f .gitignore ]; then
  sed -i '/__generated__/d' .gitignore || true
fi

echo "🚀 3. 強制加載 tina/__generated__ 並推送到 GitHub..."
git add -f tina/__generated__
git add .
git commit -m "Force add tina/__generated__ schema for TinaCloud branch indexing" || true
git push origin main --force

echo "✨ 成功將 __generated__ 檔案強行推送至 GitHub！"
