#!/bin/bash
set -e

echo "🧹 1. 刪除 Tina 在 src 中的所有殘留檔案與路由..."
rm -rf src/pages/tina-island
rm -rf src/pages/admin
rm -rf .tina

echo "🚀 2. 將變更推送至 GitHub..."
git add -A
git commit -m "Remove TinaCMS legacy leftover files and pages" || true
git push origin main --force

echo "✨ 清理完畢並已成功 Push！"
