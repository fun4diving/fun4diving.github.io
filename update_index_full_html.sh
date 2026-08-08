#!/bin/bash
set -e
echo "📦 正在將 Webnode 原始首頁內容 100% 寫入 src/pages/index.astro..."

cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="Fun肆潛水-Fun 4 Diving Official :: 首頁 Index">
  
  <!-- 1. Hero 巨幕主視覺區塊 -->
  <section class="relative min-h-[85vh] flex items-center justify-center overflow-hidden">
    <!-- 背景大圖 -->
    <div class="absolute inset-0 z-0">
      <img 
        src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000008-7b6a07b6a2/S__106807390.jpeg" 
        alt="Fun肆潛水 Hero" 
        class="w-full h-full object-cover object-center filter brightness-60 scale-105 transition duration-1000"
      />
      <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/40 to-slate-950/60"></div>
    </div>

    <!-- Hero 文案內容 -->
    <div class="relative z-10 max-w-5xl mx-auto px-4 text-center space-y-6 pt-12">
      <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-300 text-sm backdrop-blur-md">
        <span>✨ 探索藍色星球，告別潛水孤兒</span>
      </div>
      
      <h1 class="text-4xl sm:text-6xl md:text-7xl font-black text-white tracking-tight leading-tight">
        放肆潛入海洋，<br class="hidden sm:inline" /><span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-teal-300 to-blue-500">重返 蔚藍世界</span>
      </h1>

      <p class="text-lg sm:text-xl text-slate-300 max-w-3xl mx-auto font-light leading-relaxed">
        不論是體驗潛水、各階段 PADI / 證照課程、全套裝備租借，或者是熱門的國內外 Fun Dive 帶潛行程。Fun肆潛水帶你安全、悠遊享受每一次下水！
      </p>

      <div class="flex flex-col sm:flex-row items-center justify-center gap-4 pt-4">
        <a 
          href="/fun4diving-website/courses" 
          class="w-full sm:w-auto px-8 py-4 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-lg shadow-lg shadow-cyan-500/25 hover:shadow-cyan-500/40 hover:scale-105 transition duration-300"
        >
          查看課程價格與住宿
        </a>
        <a 
          href="/fun4diving-website/about" 
          class="w-full sm:w-auto px-8 py-4 rounded-xl bg-slate-900/80 hover:bg-slate-800 text-slate-200 font-bold text-lg border border-slate-700/80 backdrop-blur-md hover:scale-105 transition duration-300"
        >
          關於 Fun肆潛水
        </a>
      </div>
    </div>
  </section>

  <!-- 2. 我們的服務 (Our Services) -->
  <section class="py-20 px-4 sm:px-6 max-w-7xl mx-auto">
    <div class="text-center space-y-4 mb-16">
      <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">我們的服務</h2>
      <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
      
      <!-- 服務 1 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800 hover:border-cyan-500/40 transition duration-300 shadow-xl space-y-4 group">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-3xl group-hover:scale-110 transition duration-300">
          🤿
        </div>
        <h3 class="text-xl font-bold text-white group-hover:text-cyan-300 transition">Fun Dive、潛水課程、體驗潛水</h3>
        <p class="text-slate-400 text-sm leading-relaxed">
          不論是體驗潛水、各階段潛水課程、更不可錯過Fun肆著名的Fun Dive行程。
        </p>
      </div>

      <!-- 服務 2 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800 hover:border-cyan-500/40 transition duration-300 shadow-xl space-y-4 group">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-3xl group-hover:scale-110 transition duration-300">
          🌏
        </div>
        <h3 class="text-xl font-bold text-white group-hover:text-cyan-300 transition">國內外潛水行程</h3>
        <p class="text-slate-400 text-sm leading-relaxed">
          東北角、墾丁、小琉球、綠島、蘭嶼、還有所有的國外潛水行程，本著以潛會友的宗旨。
        </p>
      </div>

      <!-- 服務 3 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800 hover:border-cyan-500/40 transition duration-300 shadow-xl space-y-4 group">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-3xl group-hover:scale-110 transition duration-300">
          ⚙️
        </div>
        <h3 class="text-xl font-bold text-white group-hover:text-cyan-300 transition">氣瓶、裝備租借</h3>
        <p class="text-slate-400 text-sm leading-relaxed">
          所有水肺裝備、氣瓶、蛙鞋、面鏡等等以及自潛裝備租借，在最方便的位置讓您先租好裝備，有好的裝備才好安心下水。
        </p>
      </div>

      <!-- 服務 4 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800 hover:border-cyan-500/40 transition duration-300 shadow-xl space-y-4 group">
        <div class="w-14 h-14 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-3xl group-hover:scale-110 transition duration-300">
          🏠
        </div>
        <h3 class="text-xl font-bold text-white group-hover:text-cyan-300 transition">背包客房</h3>
        <p class="text-slate-400 text-sm leading-relaxed">
          舒適的空間讓您在旅程中能好好的放鬆心情，提供您像家一樣的感受。
        </p>
      </div>

    </div>
  </section>

  <!-- 3. 課程及行程詳細內容區塊 -->
  <section class="py-20 px-4 sm:px-6 bg-slate-900/40 border-y border-slate-800/80">
    <div class="max-w-6xl mx-auto space-y-16">
      <div class="text-center space-y-4">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">課程及行程詳細內容</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 lg:gap-12">
        
        <!-- 潛水課程卡片 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/40 transition duration-300">
          <div class="relative h-64 overflow-hidden">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000078-325c9325cb/puerto.jpeg" 
              alt="潛水課程" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent"></div>
          </div>
          <div class="p-8 space-y-4 flex-grow flex flex-col justify-between text-center">
            <div class="space-y-2">
              <h3 class="text-2xl font-bold text-white">潛水課程</h3>
              <p class="text-slate-400 text-sm">潛水課程及體驗潛水、Fun Dive價目都一目瞭然</p>
            </div>
            <div class="pt-4">
              <a 
                href="/fun4diving-website/courses" 
                class="inline-block px-6 py-3 rounded-xl bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-300 font-bold border border-cyan-500/30 transition duration-300"
              >
                了解更多
              </a>
            </div>
          </div>
        </div>

        <!-- Fun Dive 行程卡片 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/40 transition duration-300">
          <div class="relative h-64 overflow-hidden">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000012-50c3650c37/S__106807388.jpeg" 
              alt="Fun Dive行程" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent"></div>
          </div>
          <div class="p-8 space-y-4 flex-grow flex flex-col justify-between text-center">
            <div class="space-y-2">
              <h3 class="text-2xl font-bold text-white">Fun Dive行程</h3>
              <p class="text-slate-400 text-sm">所有本島、離島、國外的Fun Dive行程規劃</p>
            </div>
            <div class="pt-4">
              <a 
                href="/fun4diving-website/schedule" 
                class="inline-block px-6 py-3 rounded-xl bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-300 font-bold border border-cyan-500/30 transition duration-300"
              >
                了解更多
              </a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- 4. 最新消息區塊 -->
  <section class="py-20 px-4 sm:px-6 max-w-6xl mx-auto">
    <div class="text-center space-y-4 mb-16">
      <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">最新消息</h2>
      <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      
      <!-- 新聞 1 -->
      <div class="bg-slate-900/80 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col sm:flex-row hover:border-cyan-500/40 transition duration-300">
        <div class="sm:w-2/5 h-48 sm:h-auto overflow-hidden">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000020-c03cfc03d1/S__106807414.jpeg" 
            alt="加入Line社群" 
            class="w-full h-full object-cover object-center"
          />
        </div>
        <div class="sm:w-3/5 p-6 space-y-3 flex flex-col justify-between">
          <div class="space-y-2">
            <span class="text-xs font-mono text-cyan-400">2025-03-05</span>
            <h3 class="text-lg font-bold text-white hover:text-cyan-300 transition">
              <a href="https://line.me/ti/g2/w9Jk3..." target="_blank">加入Line社群可享群友優惠並即時獲得最新行程資訊</a>
            </h3>
            <p class="text-slate-400 text-xs leading-relaxed line-clamp-3">
              透過 Line 社群即可獲得群友優惠，並第一時間最快取得最新行程資訊！同時快速結交潛友，告別潛水孤兒生涯！推薦人輸入：官方網站。
            </p>
          </div>
          <div class="pt-2">
            <a href="/fun4diving-website/news" class="text-xs font-bold text-cyan-400 hover:text-cyan-300 underline">閱讀更多 →</a>
          </div>
        </div>
      </div>

      <!-- 新聞 2 -->
      <div class="bg-slate-900/80 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col sm:flex-row hover:border-cyan-500/40 transition duration-300">
        <div class="sm:w-2/5 h-48 sm:h-auto overflow-hidden">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000050-7a23d7a23e/S__106807392.jpeg" 
            alt="OW、AOW課程特價" 
            class="w-full h-full object-cover object-center"
          />
        </div>
        <div class="sm:w-3/5 p-6 space-y-3 flex flex-col justify-between">
          <div class="space-y-2">
            <span class="text-xs font-mono text-cyan-400">2025-03-05</span>
            <h3 class="text-lg font-bold text-white hover:text-cyan-300 transition">
              <a href="/fun4diving-website/news">OW、AOW課程團報特價</a>
            </h3>
            <p class="text-slate-400 text-xs leading-relaxed line-clamp-3">
              即日起滿三人團報OW、AOW課程每人特價折扣1000元，高氧潛水員課程限時優惠折扣500元！
            </p>
          </div>
          <div class="pt-2">
            <a href="/fun4diving-website/news" class="text-xs font-bold text-cyan-400 hover:text-cyan-300 underline">閱讀更多 →</a>
          </div>
        </div>
      </div>

    </div>
  </section>

</Layout>
FILE_EOF

# 推送至 GitHub
echo "🚀 正在將首頁 (Index) 完整更新推送到 GitHub..."
git add src/pages/index.astro
git commit -m "Update homepage Index to 100% match raw Webnode source with modern Tailwind layout" || true
git push origin main --force

echo "✨ 首頁更新完成！"
