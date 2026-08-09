#!/bin/bash
set -e

# 將 astro.config.mjs 裡的 base 屬性移除或設為 '/'
cat << 'FILE_EOF' > astro.config.mjs
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://fun4diving.github.io',
  base: '/',
  integrations: [tailwind()],
});
FILE_EOF

git add astro.config.mjs
git commit -m "Update astro.config.mjs base path for organization root domain" || true
git push origin main --force

echo "✨ 修改完成！網站將會在 https://fun4diving.github.io 上線！"
