#!/bin/bash
set -e

echo "⚙️ 1. 設定 package.json 的啟動指令..."
npm pkg set scripts.tinacms="tinacms dev -c \"astro dev\""

echo "🔨 2. 先手動建置一次 Tina Schema..."
npx tinacms build --local

echo "🚀 3. 推送生成的 Tina Admin 頁面與 Schema 到 GitHub..."
git add .
git commit -m "Build TinaCMS local schema and admin panel" || true
git push origin main --force

echo "✨ 完成！"
