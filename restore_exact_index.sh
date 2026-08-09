#!/bin/bash
set -e
echo "📝 正在將原始 Webnode 首頁 100% 對應寫入 src/pages/index.astro..."

cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="首頁 Index :: Fun肆潛水-Fun 4 Diving Official">
  
  <!-- 1. Hero 頂部主圖區塊 (對應原始背景圖 S__106807390.jpeg) -->
  <section class="relative h-[75vh] min-h-[480px] flex items-center justify-start overflow-hidden">
    <div class="absolute inset-0 z-0">
      <img 
        src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000008-7b6a07b6a2/S__106807390.jpeg" 
        alt="Fun肆潛水 首頁" 
        class="w-full h-full object-cover object-center filter brightness-75 scale-105"
      />
    </div>

    <div class="relative z-10 px-6 sm:px-12 max-w-7xl mx-auto w-full">
      <div class="max-w-md space-y-6">
        <a 
          href="/about" 
          class="inline-block px-8 py-4 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-black text-xl hover:scale-105 transition duration-300 shadow-2xl shadow-cyan-500/30"
        >
          關於Fun肆
        </a>
      </div>
    </div>
  </section>

  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-20">

    <!-- 2. 新增小區塊：Fun Dive 報名資訊 (放置於『我們的服務』正上方) -->
    <section class="space-y-8 bg-slate-900/60 p-6 sm:p-10 rounded-3xl border border-cyan-500/20 shadow-2xl">
      <div class="text-center space-y-2">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">Fun Dive 報名資訊</h2>
        <p class="text-cyan-400 font-medium">東北角岸潛與船潛行程填表</p>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pt-4">
        <!-- 岸潛報名 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/50 transition duration-300">
          <div class="h-60 sm:h-64 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000084-2c0072c009/puerto1.jpeg" 
              alt="東北角岸潛說明及報名表單" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
          </div>
          <div class="p-6 text-center space-y-4 flex-grow flex flex-col justify-between">
            <h3 class="text-xl font-bold text-white">東北角岸潛說明及報名表單</h3>
            <div>
              <a 
                href="https://forms.gle/qoXgVxxntnLdxXvC6" 
                target="_blank" 
                rel="nofollow noreferrer"
                class="inline-block px-6 py-3 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold hover:scale-105 transition duration-300 shadow-lg shadow-cyan-500/20"
              >
                前往填寫岸潛報名表 ↗
              </a>
            </div>
          </div>
        </div>

        <!-- 船潛報名 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/50 transition duration-300">
          <div class="h-60 sm:h-64 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000086-9c78f9c791/S__106807388-5.jpeg" 
              alt="東北角船潛報名表單" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
          </div>
          <div class="p-6 text-center space-y-4 flex-grow flex flex-col justify-between">
            <h3 class="text-xl font-bold text-white">東北角船潛報名表單</h3>
            <div>
              <a 
                href="https://forms.gle/W4EzgCd2M3tRzw9V8" 
                target="_blank" 
                rel="nofollow noreferrer"
                class="inline-block px-6 py-3 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold hover:scale-105 transition duration-300 shadow-lg shadow-cyan-500/20"
              >
                前往填寫船潛報名表 ↗
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 3. 我們的服務 (原檔四大服務項目) -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">我們的服務</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <!-- 服務 1 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🤿
          </div>
          <h3 class="text-lg font-bold text-white">Fun Dive、潛水課程、體驗潛水</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            不論是體驗潛水、各階段潛水課程、更不可錯過Fun肆著名的Fun Dive行程。
          </p>
        </div>

        <!-- 服務 2 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🌊
          </div>
          <h3 class="text-lg font-bold text-white">國內外潛水行程</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            東北角、墾丁、小琉球、綠島、蘭嶼、還有所有的國外潛水行程，本著以潛會友的宗旨。
          </p>
        </div>

        <!-- 服務 3 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            ⚓
          </div>
          <h3 class="text-lg font-bold text-white">氣瓶、裝備租借</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            所有水肺裝備、氣瓶、蛙鞋、面鏡等等以及自潛裝備租借，在最方便的位置讓您先租好裝備，有好的裝備才好安心下水。
          </p>
        </div>

        <!-- 服務 4 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🏠
          </div>
          <h3 class="text-lg font-bold text-white">背包客房</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            舒適的空間讓您在旅程中能好好的放鬆心情，提供您像家一樣的感受。
          </p>
        </div>
      </div>
    </section>

    <!-- 4. 課程及行程詳細內容 (原檔兩欄式圖片卡片) -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">課程及行程詳細內容</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- 潛水課程卡片 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col justify-between">
          <div class="h-72 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000078-325c9325cb/puerto.jpeg" 
              alt="潛水課程" 
              class="w-full h-full object-cover object-center"
            />
          </div>
          <div class="p-8 text-center space-y-4">
            <h3 class="text-2xl font-bold text-white">潛水課程</h3>
            <p class="text-slate-300 text-sm">潛水課程及體驗潛水、Fun Dive價目都一目瞭然</p>
            <a 
              href="/courses" 
              class="inline-block px-8 py-3 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold transition duration-300 shadow-lg"
            >
              了解更多
            </a>
          </div>
        </div>

        <!-- Fun Dive行程卡片 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col justify-between">
          <div class="h-72 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000012-50c3650c37/S__106807388.jpeg" 
              alt="Fun Dive行程" 
              class="w-full h-full object-cover object-center"
            />
          </div>
          <div class="p-8 text-center space-y-4">
            <h3 class="text-2xl font-bold text-white">Fun Dive行程</h3>
            <p class="text-slate-300 text-sm">所有本島、離島、國外的Fun Dive行程規劃</p>
            <a 
              href="/courses" 
              class="inline-block px-8 py-3 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold transition duration-300 shadow-lg"
            >
              了解更多
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- 5. 最新消息 (原檔新聞內容) -->
    <section class="space-y-8">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">最新消息</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="space-y-6">
        <!-- 新聞 1 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 sm:p-8 flex flex-col md:flex-row gap-6 items-center shadow-xl">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000020-c03cfc03d1/S__106807414.jpeg" 
            alt="加入Line社群" 
            class="w-full md:w-64 h-44 object-cover rounded-xl shrink-0"
          />
          <div class="space-y-3 flex-grow">
            <span class="text-xs font-mono text-cyan-400 bg-cyan-500/10 px-3 py-1 rounded-md border border-cyan-500/20">2025-03-05</span>
            <h3 class="text-xl font-bold text-white">加入Line社群可享群友優惠並即時獲得最新行程資訊</h3>
            <p class="text-slate-300 text-sm leading-relaxed">
              透過以下連結加入Line社群即可獲得群友優惠，並第一時間最快取得最新行程資訊！同時快速結交潛友，告別潛水孤兒生涯！推薦人輸入：官方網站。
            </p>
          </div>
        </div>

        <!-- 新聞 2 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 sm:p-8 flex flex-col md:flex-row gap-6 items-center shadow-xl">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000050-7a23d7a23e/S__106807392.jpeg" 
            alt="OW、AOW課程團報特價" 
            class="w-full md:w-64 h-44 object-cover rounded-xl shrink-0"
          />
          <div class="space-y-3 flex-grow">
            <span class="text-xs font-mono text-cyan-400 bg-cyan-500/10 px-3 py-1 rounded-md border border-cyan-500/20">2025-03-05</span>
            <h3 class="text-xl font-bold text-white">OW、AOW課程團報特價</h3>
            <p class="text-slate-300 text-sm leading-relaxed">
              即日起滿三人團報OW、AOW課程每人特價折扣1000元，高氧潛水員課程限時優惠折扣500元！
            </p>
          </div>
        </div>
      </div>
    </section>

  </div>
</Layout>
FILE_EOF

# 本地打包測試
npm run build

# Git 提交與推播
git add src/pages/index.astro
git commit -m "Restore exact Webnode home page structure with Fun Dive signup above services" || true
git push origin main

echo "✨ 重構完成！已完整對應原始 Webnode 首頁架構！"
