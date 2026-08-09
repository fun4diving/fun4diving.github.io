#!/bin/bash
set -e
echo "🔧 正在修復 astro.config.mjs 與資源路徑以支援根網域 https://fun4diving.github.io/ ..."

# 1. 更新 astro.config.mjs 設定
cat << 'FILE_EOF' > astro.config.mjs
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://fun4diving.github.io',
  base: '/',
  integrations: [tailwind()],
});
FILE_EOF

# 2. 將頁面中的舊子路徑修復為根路徑
find src/ -type f \( -name "*.astro" -o -name "*.json" \) -exec sed -i 's|/fun4diving-website/|/|g' {} +
find src/ -type f \( -name "*.astro" -o -name "*.json" \) -exec sed -i 's|/fun4diving/|/|g' {} +

# 3. 本地打包測試
echo "🧪 本地 build 測試中..."
npm run build

# 4. 推送到 GitHub
echo "🚀 推送修復版至 GitHub..."
git add .
git commit -m "Fix asset paths and base config for root domain https://fun4diving.github.io" || true
git push origin main --force

echo "✨ 修復完成！"
