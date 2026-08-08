#!/bin/bash
set -e

echo "🔨 1. 強制在 Local 生成 __generated__ Schema 產物..."
TINA_PUBLIC_IS_LOCAL=true npx tinacms build --local

echo "📂 2. 檢查並確保 .gitignore 沒有擋掉 tina/__generated__..."
if [ -f .gitignore ]; then
  sed -i '/__generated__/d' .gitignore
fi

echo "🚀 3. 將包含 tina/__generated__ 的所有檔案推送到 GitHub..."
git add -f tina/
git add .
git commit -m "Add TinaCMS generated schema files for TinaCloud indexing" || true
git push origin main --force

echo "✨ 成功推送 Schema！"
