#!/bin/bash
set -e
echo "🚀 開始自動配置 Fun肆潛水 響應式網站..."

# 1. 寫入 package.json
cat << 'FILE_EOF' > package.json
{
  "name": "fun4diving-website",
  "type": "module",
  "version": "0.0.1",
  "scripts": {
    "dev": "astro dev",
    "start": "astro dev",
    "build": "astro build",
    "preview": "astro preview",
    "astro": "astro"
  },
  "dependencies": {
    "@astrojs/tailwind": "^5.1.0",
    "astro": "^4.15.0",
    "tailwindcss": "^3.4.1"
  }
}
FILE_EOF

# 2. 寫入 astro.config.mjs
cat << 'FILE_EOF' > astro.config.mjs
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://nike70543.github.io',
  base: '/fun4diving-website',
  integrations: [tailwind()],
});
FILE_EOF

# 3. 建立必要目錄結構
mkdir -p src/layouts src/pages public/admin public/uploads .github/workflows src/content/news

# 4. 寫入 .github/workflows/deploy.yml
cat << 'FILE_EOF' > .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Install dependencies
        run: npm install
      - name: Build site
        run: npm run build
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    needs: build
    runs-on: ubuntu-latest
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
FILE_EOF

# 5. 寫入全站通用 Layout.astro
cat << 'FILE_EOF' > src/layouts/Layout.astro
---
interface Props { title: string; }
const { title } = Astro.props;
---
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{title} | Fun肆潛水 Fun 4 Diving Club</title>
  </head>
  <body class="bg-slate-900 text-slate-100 min-h-screen flex flex-col font-sans">
    <div class="bg-cyan-950 text-cyan-200 text-xs py-2.5 px-4 flex justify-between items-center border-b border-cyan-800/50">
      <div>📍 新北市瑞芳區洞頂路136-6號 | 📞 +886-921-167-406</div>
      <div class="flex gap-4">
        <a href="https://www.facebook.com/profile.php?id=61559833718251" target="_blank" class="hover:text-white transition">FB</a>
        <a href="https://www.instagram.com/fun4_diving" target="_blank" class="hover:text-white transition">IG</a>
        <a href="http://lin.ee/lSvAOy4" target="_blank" class="hover:text-white transition">LINE</a>
        <a href="https://wa.me/+886921167406" target="_blank" class="hover:text-white transition">WhatsApp</a>
      </div>
    </div>

    <header class="sticky top-0 z-50 bg-slate-900/90 backdrop-blur border-b border-slate-800">
      <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
        <a href="/fun4diving-website/" class="text-xl font-bold text-cyan-400 tracking-wider">
          Fun肆潛水 <span class="text-xs text-slate-400 block sm:inline">Fun 4 Diving Club</span>
        </a>
        <nav class="hidden md:flex space-x-6 text-sm font-medium">
          <a href="/fun4diving-website/" class="hover:text-cyan-400 transition">首頁</a>
          <a href="/fun4diving-website/about" class="hover:text-cyan-400 transition">關於我們</a>
          <a href="/fun4diving-website/news" class="hover:text-cyan-400 transition">最新消息</a>
          <a href="/fun4diving-website/courses" class="hover:text-cyan-400 transition">潛水課程與住宿</a>
          <a href="/fun4diving-website/schedule" class="hover:text-cyan-400 transition">活動列表</a>
          <a href="/fun4diving-website/contact" class="hover:text-cyan-400 transition">聯絡我們</a>
        </nav>
      </div>
    </header>

    <main class="flex-grow">
      <slot />
    </main>

    <footer class="bg-slate-950 text-slate-400 py-10 px-4 border-t border-slate-800 text-sm">
      <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
          <h3 class="text-slate-200 font-bold mb-3 text-base">Fun肆潛水 Fun 4 Diving Club</h3>
          <p class="leading-relaxed">提供體驗潛水、證照課程、Fun Dive 國內外行程與裝備租借服務。</p>
        </div>
        <div>
          <h3 class="text-slate-200 font-bold mb-3 text-base">聯絡方式</h3>
          <p class="mb-1">📧 Email: fun4divingofficial@gmail.com</p>
          <p>📞 電話: +886-921-167-406</p>
        </div>
        <div>
          <h3 class="text-slate-200 font-bold mb-3 text-base">地址資訊</h3>
          <p>📍 22451 新北市瑞芳區洞頂路136-6號</p>
        </div>
      </div>
      <div class="text-center mt-10 pt-6 border-t border-slate-800/60 text-xs text-slate-500">
        © {new Date().getFullYear()} Fun肆潛水 Fun 4 Diving Club. All rights reserved.
      </div>
    </footer>
  </body>
</html>
FILE_EOF

# 6. 寫入首頁 index.astro
cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="首頁 Index">
  <section class="relative bg-gradient-to-b from-slate-800 to-slate-900 py-24 px-4 text-center border-b border-slate-800">
    <div class="max-w-4xl mx-auto">
      <h1 class="text-4xl md:text-6xl font-extrabold text-white mb-6 tracking-tight">
        探索海洋，從 <span class="text-cyan-400">Fun肆潛水</span> 開始
      </h1>
      <p class="text-lg md:text-xl text-slate-300 mb-8 leading-relaxed">
        不論是體驗潛水、各階段證照課程、裝備租借，或是國內外 Fun Dive 行程，帶你安全悠遊藍色大海。
      </p>
      <div class="flex flex-wrap justify-center gap-4">
        <a href="/fun4diving-website/courses" class="bg-cyan-500 hover:bg-cyan-600 text-slate-950 font-bold px-6 py-3 rounded-lg transition shadow-lg shadow-cyan-500/20">了解課程價格</a>
        <a href="/fun4diving-website/schedule" class="bg-slate-800 hover:bg-slate-700 text-white font-bold px-6 py-3 rounded-lg border border-slate-700 transition">查看最新行程</a>
      </div>
    </div>
  </section>

  <section class="max-w-7xl mx-auto py-16 px-4">
    <h2 class="text-3xl font-bold text-center text-cyan-400 mb-12">我們的服務</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
      <div class="bg-slate-800/60 p-6 rounded-xl border border-slate-700/80">
        <div class="text-3xl mb-3">🥽</div>
        <h3 class="text-xl font-bold text-white mb-2">Fun Dive & 課程</h3>
        <p class="text-slate-300 text-sm">體驗潛水、各階段水肺證照課程，以及熱門的 Fun Dive 行程。</p>
      </div>
      <div class="bg-slate-800/60 p-6 rounded-xl border border-slate-700/80">
        <div class="text-3xl mb-3">🌏</div>
        <h3 class="text-xl font-bold text-white mb-2">國內外潛水行程</h3>
        <p class="text-slate-300 text-sm">東北角、墾丁、小琉球、綠島、蘭嶼及國外潛點行程規劃。</p>
      </div>
      <div class="bg-slate-800/60 p-6 rounded-xl border border-slate-700/80">
        <div class="text-3xl mb-3">⚓</div>
        <h3 class="text-xl font-bold text-white mb-2">氣瓶與裝備租借</h3>
        <p class="text-slate-300 text-sm">水肺與自潛完整裝備、氣瓶租借，位置便利安心下水。</p>
      </div>
      <div class="bg-slate-800/60 p-6 rounded-xl border border-slate-700/80">
        <div class="text-3xl mb-3">🏠</div>
        <h3 class="text-xl font-bold text-white mb-2">背包客房住宿</h3>
        <p class="text-slate-300 text-sm">舒適溫馨的空間，讓你在潛水旅程中放鬆休息。</p>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 7. 寫入其餘子頁面 (about, news, courses, schedule, contact)
cat << 'FILE_EOF' > src/pages/about.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="關於我們">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <h1 class="text-3xl font-bold text-cyan-400 mb-6">關於 Fun肆潛水</h1>
    <div class="bg-slate-800 p-8 rounded-xl border border-slate-700 text-slate-200 space-y-4">
      <p>Fun肆潛水 (Fun 4 Diving Club) 本著「以潛會友」的宗旨，致力於提供最安全、最專業且具溫度的潛水體驗。</p>
      <p>我們的基地部位於東北角瑞芳洞頂路，提供完整的水肺潛水與自由潛水訓練、設備租借與背包客房住宿。</p>
    </div>
  </section>
</Layout>
FILE_EOF

cat << 'FILE_EOF' > src/pages/news.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="最新消息">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <h1 class="text-3xl font-bold text-cyan-400 mb-8">最新消息 News</h1>
    <div class="space-y-6">
      <article class="bg-slate-800 p-6 rounded-xl border border-slate-700">
        <span class="text-xs text-cyan-400 bg-cyan-950 px-2.5 py-1 rounded border border-cyan-800">2025-03-05</span>
        <h2 class="text-xl font-bold text-white mt-3 mb-2">加入 Line 社群可享群友優惠並即時獲得最新行程資訊</h2>
        <p class="text-slate-300 text-sm">透過指定連結加入 Line 社群即可獲得群友優惠，並第一時間取得最新行程資訊！</p>
      </article>
    </div>
  </section>
</Layout>
FILE_EOF

cat << 'FILE_EOF' > src/pages/courses.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="潛水課程與住宿">
  <section class="max-w-5xl mx-auto py-16 px-4">
    <h1 class="text-3xl font-bold text-cyan-400 mb-8">潛水課程與住宿 Course & Hostel</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <div class="bg-slate-800 p-6 rounded-xl border border-slate-700">
        <h2 class="text-2xl font-bold text-white mb-4">🥽 潛水課程項目</h2>
        <ul class="space-y-3 text-slate-300 text-sm">
          <li class="p-3 bg-slate-900/60 rounded">✓ 體驗潛水 (Discover Scuba Diving)</li>
          <li class="p-3 bg-slate-900/60 rounded">✓ OW 初級開放水域潛水員課程</li>
          <li class="p-3 bg-slate-900/60 rounded">✓ AOW 進階開放水域潛水員課程</li>
          <li class="p-3 bg-slate-900/60 rounded">✓ 高氧潛水員專長課程</li>
        </ul>
      </div>
      <div class="bg-slate-800 p-6 rounded-xl border border-slate-700">
        <h2 class="text-2xl font-bold text-white mb-4">🏠 背包客房住宿</h2>
        <p class="text-slate-300 text-sm">提供舒適的背包客休息空間，讓你在潛水後放鬆休息。</p>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

cat << 'FILE_EOF' > src/pages/schedule.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="活動列表">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <h1 class="text-3xl font-bold text-cyan-400 mb-8">Fun肆潛水活動列表 Schedule</h1>
    <div class="bg-slate-800 p-8 rounded-xl border border-slate-700 text-center">
      <p class="text-slate-300 mb-6">所有的東北角、墾丁、離島及國外 Fun Dive 梯次表，會定期於 Line 社群與官方粉絲頁更新。</p>
      <a href="http://lin.ee/lSvAOy4" target="_blank" class="inline-block bg-emerald-600 hover:bg-emerald-500 text-white font-bold px-6 py-3 rounded-lg">加入 LINE 社群</a>
    </div>
  </section>
</Layout>
FILE_EOF

cat << 'FILE_EOF' > src/pages/contact.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="聯絡我們">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <h1 class="text-3xl font-bold text-cyan-400 mb-8">聯絡我們 Contact</h1>
    <div class="bg-slate-800 p-8 rounded-xl border border-slate-700 space-y-6 text-slate-200">
      <div><h3 class="text-cyan-400 font-bold mb-1">📍 地址</h3><p>新北市瑞芳區洞頂路136-6號 (22451)</p></div>
      <div><h3 class="text-cyan-400 font-bold mb-1">📞 電話</h3><p>+886-921-167-406</p></div>
      <div><h3 class="text-cyan-400 font-bold mb-1">📧 Email</h3><p>fun4divingofficial@gmail.com</p></div>
    </div>
  </section>
</Layout>
FILE_EOF

# 8. 寫入管理後台設定
cat << 'FILE_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Fun肆潛水 管理後台</title>
  </head>
  <body>
    <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
  </body>
</html>
FILE_EOF

cat << 'FILE_EOF' > public/admin/config.yml
backend:
  name: git-gateway
  branch: main
media_folder: "public/uploads"
public_folder: "/uploads"
collections:
  - name: "news"
    label: "最新消息"
    folder: "src/content/news"
    create: true
    fields:
      - { label: "標題", name: "title", widget: "string" }
      - { label: "日期", name: "date", widget: "datetime" }
      - { label: "內容", name: "body", widget: "markdown" }
FILE_EOF

# 9. 自動提交並推送到 GitHub
echo "📦 正在推送檔案上 GitHub..."
git add .
git commit -m "Auto setup complete website with dark ocean responsive theme" || true
git push origin main --force

echo "✅ 完成！請回到 GitHub 網頁查看 Actions 自動上線進度！"
