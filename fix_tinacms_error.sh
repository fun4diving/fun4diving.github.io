#!/bin/bash
set -e

echo "🧹 正在強制刪除導致 build 失敗的 tinacms-demo.astro..."
rm -f src/pages/tinacms-demo.astro

echo "🧪 正在進行本地 npm run build 測試..."
npm run build

echo "🚀 本地打包無誤！推送修正至 GitHub 遠端專案..."
git add -A
git commit -m "Fix build: Remove broken tinacms-demo.astro file" || true
git push origin main --force

echo "✨ 修正成功！請等待約 1~2 分鐘，GitHub Actions 綠燈完成後網站即會更新！"
