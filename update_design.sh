#!/bin/bash
set -e
echo "🎨 正在注入高質感海洋風設計..."

# 1. 更新 TailWind Config 支援質感色系
cat << 'FILE_EOF' > tailwind.config.mjs
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        ocean: {
          950: '#030712',
          900: '#0b1329',
          800: '#112240',
          700: '#1d3557',
          400: '#38bdf8',
          300: '#7dd3fc',
        },
        cyan: {
          400: '#22d3ee',
          500: '#06b6d4',
          600: '#0891b2',
        }
      }
    },
  },
  plugins: [],
};
FILE_EOF

# 2. 全站頂級 Layout (玻璃擬態導航 + 質感頁尾)
cat << 'FILE_EOF' > src/layouts/Layout.astro
---
interface Props { title: string; }
const { title } = Astro.props;
---
<!DOCTYPE html>
<html lang="zh-TW" class="scroll-smooth">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{title} | Fun肆潛水 Fun 4 Diving Club</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;600;700;900&display=swap" rel="stylesheet">
  </head>
  <body class="bg-[#070f1e] text-slate-100 min-h-screen flex flex-col font-['Noto_Sans_TC',sans-serif] selection:bg-cyan-500 selection:text-slate-950">
    <!-- 頂部精細聯絡條 -->
    <div class="bg-gradient-to-r from-slate-950 via-ocean-900 to-slate-950 text-cyan-300 text-xs py-2 px-4 border-b border-cyan-500/10">
      <div class="max-w-7xl mx-auto flex flex-col sm:flex-row justify-between items-center gap-2">
        <div class="flex items-center gap-2">
          <span class="inline-block w-2 h-2 rounded-full bg-cyan-400 animate-pulse"></span>
          <span>📍 新北市瑞芳區洞頂路136-6號 ｜ 📞 +886-921-167-406</span>
        </div>
        <div class="flex gap-4 font-medium tracking-wide">
          <a href="https://www.facebook.com/profile.php?id=61559833718251" target="_blank" class="hover:text-white transition">FB</a>
          <a href="https://www.instagram.com/fun4_diving" target="_blank" class="hover:text-white transition">IG</a>
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="hover:text-white transition">LINE 社群</a>
          <a href="https://wa.me/+886921167406" target="_blank" class="hover:text-white transition">WhatsApp</a>
        </div>
      </div>
    </div>

    <!-- 玻璃擬態導覽列 (Glassmorphism Header) -->
    <header class="sticky top-0 z-50 bg-[#070f1e]/80 backdrop-blur-md border-b border-slate-800/80 shadow-2xl">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 flex justify-between items-center">
        <a href="/fun4diving-website/" class="group flex items-center gap-3">
          <div class="w-9 h-9 rounded-lg bg-gradient-to-tr from-cyan-500 to-blue-600 flex items-center justify-center font-black text-slate-950 text-xl shadow-lg shadow-cyan-500/30 group-hover:scale-105 transition">
            4
          </div>
          <div class="flex flex-col">
            <span class="text-xl font-black text-white tracking-wider group-hover:text-cyan-400 transition">Fun肆潛水</span>
            <span class="text-[10px] text-cyan-400/80 uppercase tracking-widest font-semibold">Fun 4 Diving Club</span>
          </div>
        </a>
        <nav class="hidden md:flex items-center space-x-8 text-sm font-semibold tracking-wide text-slate-300">
          <a href="/fun4diving-website/" class="hover:text-cyan-400 transition">首頁</a>
          <a href="/fun4diving-website/about" class="hover:text-cyan-400 transition">關於我們</a>
          <a href="/fun4diving-website/news" class="hover:text-cyan-400 transition">最新消息</a>
          <a href="/fun4diving-website/courses" class="hover:text-cyan-400 transition">潛水課程與住宿</a>
          <a href="/fun4diving-website/schedule" class="hover:text-cyan-400 transition">活動列表</a>
          <a href="/fun4diving-website/contact" class="bg-gradient-to-r from-cyan-500 to-blue-600 text-slate-950 px-4 py-2 rounded-lg font-bold shadow-md shadow-cyan-500/20 hover:shadow-cyan-500/40 hover:scale-105 transition">聯絡我們</a>
        </nav>
      </div>
    </header>

    <!-- 主頁面內容 -->
    <main class="flex-grow">
      <slot />
    </main>

    <!-- 質感深海頁尾 -->
    <footer class="bg-[#030712] text-slate-400 py-12 px-4 border-t border-slate-800/80 text-sm">
      <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 mb-12">
        <div class="md:col-span-2 space-y-4">
          <div class="flex items-center gap-2">
            <span class="text-xl font-bold text-white">Fun肆潛水</span>
            <span class="text-xs text-cyan-400 bg-cyan-950/80 px-2 py-0.5 rounded border border-cyan-800/50">東北角專業潛水基地</span>
          </div>
          <p class="text-slate-400 text-sm leading-relaxed max-w-md">
            秉持以潛會友的初衷，提供水肺潛水體驗、PADI / 各階段證照課程、裝備租借、背包客房住宿與國內外 Fun Dive 行程。帶你探索藍色星球的無限可能。
          </p>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4 tracking-wider text-base border-l-2 border-cyan-400 pl-2">快速連結</h3>
          <ul class="space-y-2.5 text-sm">
            <li><a href="/fun4diving-website/courses" class="hover:text-cyan-400 transition">潛水課程價格</a></li>
            <li><a href="/fun4diving-website/schedule" class="hover:text-cyan-400 transition">近期行程 Schedule</a></li>
            <li><a href="/fun4diving-website/news" class="hover:text-cyan-400 transition">最新優惠消息</a></li>
            <li><a href="/fun4diving-website/contact" class="hover:text-cyan-400 transition">據點位置與聯繫</a></li>
          </ul>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4 tracking-wider text-base border-l-2 border-cyan-400 pl-2">聯絡資訊</h3>
          <ul class="space-y-2.5 text-sm">
            <li class="flex items-start gap-2">📍 <span>22451 新北市瑞芳區洞頂路136-6號</span></li>
            <li class="flex items-center gap-2">📞 <span>+886-921-167-406</span></li>
            <li class="flex items-center gap-2">📧 <span class="break-all">fun4divingofficial@gmail.com</span></li>
          </ul>
        </div>
      </div>
      <div class="max-w-7xl mx-auto pt-6 border-t border-slate-900 text-center text-xs text-slate-500 flex flex-col sm:flex-row justify-between items-center gap-4">
        <div>© {new Date().getFullYear()} Fun肆潛水 Fun 4 Diving Club. All rights reserved.</div>
        <div class="text-slate-600">Designed with passion for the ocean.</div>
      </div>
    </footer>
  </body>
</html>
FILE_EOF

# 3. 超大氣視覺首頁 (index.astro)
cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="首頁 Index">
  <!-- Hero 強烈視覺 Banner -->
  <section class="relative min-h-[85vh] flex items-center justify-center overflow-hidden bg-gradient-to-b from-[#0b192e] via-[#071325] to-[#070f1e] px-4 py-20 border-b border-slate-800/80">
    <!-- 背景螢光藍光暈效果 -->
    <div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[300px] bg-cyan-500/10 blur-[120px] rounded-full pointer-events-none"></div>

    <div class="relative max-w-5xl mx-auto text-center z-10 space-y-8">
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-cyan-500/10 border border-cyan-500/30 text-cyan-300 text-xs font-semibold tracking-widest uppercase mb-2 backdrop-blur-sm">
        ✨ 探索藍色星球 · 告別潛水孤兒
      </div>

      <h1 class="text-5xl sm:text-6xl md:text-7xl font-black text-white tracking-tight leading-none">
        放肆潛入海洋，<br class="hidden sm:inline" />重返 <span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-sky-300 to-blue-500">蔚藍世界</span>
      </h1>

      <p class="text-lg sm:text-xl text-slate-300 max-w-2xl mx-auto leading-relaxed font-light">
        不論是體驗潛水、各階段 PADI / 證照課程、全套裝備租借，或是熱門的國內外 Fun Dive 帶潛行程。Fun肆潛水帶你安全、悠遊享受每一次下水！
      </p>

      <div class="flex flex-col sm:flex-row justify-center items-center gap-4 pt-4">
        <a href="/fun4diving-website/courses" class="w-full sm:w-auto bg-gradient-to-r from-cyan-400 to-blue-600 hover:from-cyan-300 hover:to-blue-500 text-slate-950 font-black px-8 py-4 rounded-xl transition shadow-xl shadow-cyan-500/25 hover:shadow-cyan-500/40 hover:-translate-y-0.5 text-center">
          查看課程價格與住宿
        </a>
        <a href="/fun4diving-website/schedule" class="w-full sm:w-auto bg-slate-900/80 hover:bg-slate-800 text-white font-bold px-8 py-4 rounded-xl border border-slate-700/80 hover:border-cyan-500/50 transition backdrop-blur-sm text-center">
          探索近期活動梯次 →
        </a>
      </div>
    </div>
  </section>

  <!-- 我們的服務 (Cards with Hover Glow) -->
  <section class="max-w-7xl mx-auto py-24 px-4 sm:px-6">
    <div class="text-center space-y-4 mb-16">
      <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">我們的核心服務</h2>
      <p class="text-slate-400 max-w-xl mx-auto text-sm">提供全方位的水肺與自潛支援，給您最完善與便利的潛水體驗。</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
      <div class="group relative bg-slate-900/60 p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/50 transition-all duration-300 hover:-translate-y-1.5 shadow-xl">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-2xl mb-6 text-cyan-400 group-hover:scale-110 transition">
          🥽
        </div>
        <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition">Fun Dive & 課程</h3>
        <p class="text-slate-400 text-sm leading-relaxed">提供體驗潛水、OW 初級、AOW 進階與高氧專長課程，引導新手建立水下自信。</p>
      </div>

      <div class="group relative bg-slate-900/60 p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/50 transition-all duration-300 hover:-translate-y-1.5 shadow-xl">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-2xl mb-6 text-cyan-400 group-hover:scale-110 transition">
          🌊
        </div>
        <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition">國內外潛水行程</h3>
        <p class="text-slate-400 text-sm leading-relaxed">東北角、墾丁、小琉球、綠島、蘭嶼及各國潛點專屬帶潛行程，以潛會友！</p>
      </div>

      <div class="group relative bg-slate-900/60 p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/50 transition-all duration-300 hover:-translate-y-1.5 shadow-xl">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-2xl mb-6 text-cyan-400 group-hover:scale-110 transition">
          ⚓
        </div>
        <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition">氣瓶與裝備租借</h3>
        <p class="text-slate-400 text-sm leading-relaxed">提供完整的專業水肺裝備、高純度氣瓶與自潛設備租借，位置便利隨時整備。</p>
      </div>

      <div class="group relative bg-slate-900/60 p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/50 transition-all duration-300 hover:-translate-y-1.5 shadow-xl">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-2xl mb-6 text-cyan-400 group-hover:scale-110 transition">
          🏠
        </div>
        <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition">背包客房住宿</h3>
        <p class="text-slate-400 text-sm leading-relaxed">溫馨舒適的背包客空間，讓您在精采的下水行程前後能像在家一樣完全放鬆。</p>
      </div>
    </div>
  </section>

  <!-- 行動呼籲 Banner (CTA) -->
  <section class="max-w-7xl mx-auto px-4 pb-24">
    <div class="relative rounded-3xl bg-gradient-to-r from-cyan-950 via-slate-900 to-blue-950 p-10 sm:p-16 border border-cyan-500/30 overflow-hidden shadow-2xl">
      <div class="relative z-10 max-w-2xl space-y-6">
        <h2 class="text-3xl sm:text-4xl font-black text-white">準備好開啟你的水下冒險了嗎？</h2>
        <p class="text-slate-300 text-sm sm:text-base leading-relaxed">
          加入我們的 LINE 社群，除了能第一時間取得最新國外與離島 Fun Dive 梯次，還可享有官方網站限定的群友團報折扣優惠！
        </p>
        <div>
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-black px-6 py-3.5 rounded-xl transition shadow-lg shadow-emerald-500/20">
            💬 立即加入 LINE 社群領取優惠
          </a>
        </div>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 4. 提交並強制推送到 GitHub
echo "🚀 正在推送美化後的版型到 GitHub..."
git add .
git commit -m "Upgrade design: Ocean dark style with cards and glassmorphism header" || true
git push origin main --force

echo "✨ 成功！頁面美化更新完畢！"
