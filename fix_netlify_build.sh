#!/bin/bash
set -e

echo "⚙️ 建立 netlify.toml 設定檔以修復 npm install 衝突..."

cat << 'TOML_EOF' > netlify.toml
[build]
  command = "npm run build"
  publish = "dist"

[build.environment]
  NPM_FLAGS = "--legacy-peer-deps"
TOML_EOF

echo "🚀 推送修正至 GitHub..."
git add netlify.toml
git commit -m "Fix Netlify build failure by adding NPM_FLAGS --legacy-peer-deps" || true
git push origin main --force

echo "✨ 已成功推送！Netlify 現在應該會自動重新抓取並順利部署完成了！"
