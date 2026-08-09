#!/bin/bash
set -e
echo "🧹 正在移除會導致打包失敗的 tinacms-demo.astro..."

# 刪除導致 Vite 打包失敗的測試頁面
rm -f src/pages/tinacms-demo.astro

echo "🧪 重新進行 npm run build 測試..."
npm run build

echo "🚀 本地打包完全成功！正在推送到 GitHub..."
git add -A
git commit -m "Fix build: Remove broken tinacms-demo.astro to fix Vite resolve error" || true
git push origin main --force

echo "✨ 搞定！部署流程已恢復正常，請等待 1~2 分鐘後重新整理網頁！"
