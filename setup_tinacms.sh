#!/bin/bash
set -e

echo "📦 正在安裝 TinaCMS 相關套件..."
npx @tinacms/cli@latest init

# 清除之前建立的 Decap CMS / Netlify 檔案
rm -rf public/admin

echo "🚀 正在將 TinaCMS 基礎結構推送至 GitHub..."
git add .
git commit -m "Initialize TinaCMS for visual inline editing" || true
git push origin main --force

echo "✨ 第一階段安裝成功！"
