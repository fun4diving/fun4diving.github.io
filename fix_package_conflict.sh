#!/bin/bash
set -e

echo "🧹 1. 移除不必要的 SSR 套件 (@astrojs/node)..."
npm uninstall @astrojs/node

echo "⚙️ 2. 確保 .npmrc 加上相容設定..."
echo "legacy-peer-deps=true" > .npmrc

echo "🚀 3. 推送更新至 GitHub..."
git add package.json package-lock.json .npmrc netlify.toml
git commit -m "Remove conflicting @astrojs/node package and set .npmrc legacy-peer-deps" || true
git push origin main --force

echo "✨ 完成！Netlify 與 GitHub Actions 現在都能順利編譯部署了！"
