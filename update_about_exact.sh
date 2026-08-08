#!/bin/bash
set -e
echo "📦 正在將舊站『關於我們』完全相同的文字與圖片架構寫入 src/pages/about.astro..."

cat << 'FILE_EOF' > src/pages/about.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="Fun肆潛水 Fun 4 Diving Club">
  <section class="max-w-5xl mx-auto py-16 px-4">
    <!-- 頁面頂部標題區 -->
    <div class="text-center space-y-4 mb-12">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">About Us</span>
      <h1 class="text-3xl sm:text-5xl font-black text-white tracking-tight">Fun肆潛水 Fun 4 Diving Club</h1>
      <p class="text-lg text-cyan-400 font-bold">以潛會友，更不可錯過的 Fun肆潛水</p>
      <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <!-- 舊網頁核心內文卡片 -->
    <div class="bg-slate-900/80 p-8 sm:p-12 rounded-3xl border border-slate-800 shadow-2xl space-y-8 text-slate-200 text-base sm:text-lg leading-relaxed">
      <div class="space-y-6">
        <p class="border-l-4 border-cyan-400 pl-4 py-1 text-white font-medium">
          不論是體驗潛水、各階段水肺潛水課程、背包客房住宿，更不可錯過 Fun肆著名的 Fun Dive 行程。
        </p>

        <p>
          東北角、墾丁、小琉球、綠島、蘭嶼、還有所有的國外潛水行程，本著以潛會友的宗旨，Fun肆潛水提供您像家一樣的感受。
        </p>
      </div>

      <!-- 快捷服務導航點擊區 -->
      <div class="pt-8 border-t border-slate-800/80 grid grid-cols-1 sm:grid-cols-3 gap-4 text-center">
        <a href="/fun4diving-website/courses" class="p-4 bg-slate-950/60 hover:bg-slate-950 rounded-xl border border-slate-800/80 hover:border-cyan-500/40 transition">
          <div class="text-2xl mb-1">🥽</div>
          <div class="font-bold text-white text-sm">潛水課程與住宿</div>
        </a>
        <a href="/fun4diving-website/schedule" class="p-4 bg-slate-950/60 hover:bg-slate-950 rounded-xl border border-slate-800/80 hover:border-cyan-500/40 transition">
          <div class="text-2xl mb-1">🌏</div>
          <div class="font-bold text-white text-sm">Fun Dive 行程列表</div>
        </a>
        <a href="/fun4diving-website/contact" class="p-4 bg-slate-950/60 hover:bg-slate-950 rounded-xl border border-slate-800/80 hover:border-cyan-500/40 transition">
          <div class="text-2xl mb-1">📞</div>
          <div class="font-bold text-white text-sm">聯絡我們</div>
        </a>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 自動 Commit 與 Push
echo "🚀 正在將『關於我們』更新推送至 GitHub..."
git add src/pages/about.astro
git commit -m "Update about page to match exact content from Webnode about index page" || true
git push origin main --force

echo "✨ 成功！舊站『關於我們』內容已完全同步更新！"
