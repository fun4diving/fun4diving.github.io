#!/bin/bash
set -e

echo "🔨 1. 使用無 ClientID 的 local 模式強行導出 Schema..."
TINA_CLIENT_ID="" TINA_TOKEN="" npx tinacms build --local

echo "📂 2. 解除 .gitignore 並強制添加 __generated__..."
if [ -f .gitignore ]; then
  sed -i '/__generated__/d' .gitignore || true
fi
git add -f tina/__generated__
git add .

echo "🚀 3. 推送至 GitHub 讓 TinaCloud 進行索引..."
git commit -m "Add tina/__generated__ schema to enable main branch indexing" || true
git push origin main --force

echo "✨ 成功推送到 GitHub！"
