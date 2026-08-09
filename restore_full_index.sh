#!/bin/bash
set -e
echo "📝 正在完整恢復 index.astro：保留所有原始資訊，並將 Fun Dive 報名區塊放置於『我們的服務』上方..."

cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="首頁 Index :: Fun肆潛水-Fun 4 Diving Official">
  
  <!-- 1. Hero Banner 區塊 -->
  <section class="relative h-[80vh] min-h-[500px] flex items-center justify-center overflow-hidden">
    <div class="absolute inset-0 z-0">
      <img 
        src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000015-6b27f6b281/tanktest2.webp" 
        alt="Fun肆潛水 Hero" 
        class="w-full h-full object-cover object-center filter brightness-50 scale-105"
      />
    </div>

    <div class="relative z-10 text-center px-4 max-w-4xl space-y-6">
      <h1 class="text-4xl sm:text-6xl font-black text-white tracking-tight drop-shadow-lg">
        Fun 4 Diving Official
      </h1>
      <p class="text-xl sm:text-2xl font-light text-cyan-200 tracking-wider drop-shadow-md">
        探索湛藍海洋，盡情 FUN 肆悠遊
      </p>
      <div class="pt-4 flex flex-wrap justify-center gap-4">
        <a 
          href="/courses" 
          class="px-8 py-3.5 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-lg hover:scale-105 transition duration-300 shadow-lg shadow-cyan-500/25"
        >
          探索潛水課程 ↗
        </a>
        <a 
          href="/schedule" 
          class="px-8 py-3.5 rounded-xl bg-slate-900/80 hover:bg-slate-800 text-white border border-slate-700 font-bold text-lg transition duration-300"
        >
          最新活動列表 ➔
        </a>
      </div>
    </div>
  </section>

  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-24">

    <!-- 2. 關於 Fun肆潛水 區塊 -->
    <section class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
      <div class="space-y-6">
        <div class="inline-block px-3 py-1 rounded-lg bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 font-bold text-sm">
          ABOUT FUN 4 DIVING
        </div>
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight leading-snug">
          關於 Fun肆潛水
        </h2>
        <p class="text-slate-300 leading-relaxed text-base sm:text-lg">
          我們是一群熱愛海洋、致力於推廣安全與趣味潛水的專業團隊。無論你是剛接觸潛水的新手，還是追求更高技術的熱血潛友，Fun肆潛水都能提供最完善的教學、貼心的旅程規劃與安全的潛水體驗。
        </p>
        <p class="text-slate-400 leading-relaxed text-sm sm:text-base">
          基地位於東北角瑞芳洞頂路，提供課程教學、Fun Dive 帶潛以及背包客棧住宿，讓你來到東北角就像回到自己的家。
        </p>
        <div>
          <a 
            href="/about" 
            class="inline-flex items-center gap-2 text-cyan-400 font-bold hover:text-cyan-300 transition"
          >
            了解更多關於我們的故事 →
          </a>
        </div>
      </div>

      <div class="rounded-2xl overflow-hidden border border-slate-800 shadow-2xl relative group">
        <img 
          src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000084-2c0072c009/puerto1.jpeg" 
          alt="Fun肆潛水 活動照片" 
          class="w-full h-auto object-cover group-hover:scale-105 transition duration-500"
        />
      </div>
    </section>

    <!-- 3. Fun Dive 報名資訊 (岸潛 & 船潛) 區塊 ➔ 放在「我們的服務」上方 -->
    <section class="space-y-8 bg-slate-900/60 p-8 sm:p-10 rounded-3xl border border-cyan-500/20 shadow-2xl">
      <div class="text-center space-y-2">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">Fun Dive 報名資訊</h2>
        <p class="text-cyan-400 font-medium">東北角岸潛與船潛行程填表</p>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pt-4">
        <!-- 岸潛報名 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/50 transition duration-300">
          <div class="h-64 sm:h-72 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000084-2c0072c009/puerto1.jpeg" 
              alt="東北角岸潛說明及報名表單" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
          </div>
          <div class="p-8 text-center space-y-4 flex-grow flex flex-col justify-between">
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
          <div class="h-64 sm:h-72 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000086-9c78f9c791/S__106807388-5.jpeg" 
              alt="東北角船潛報名表單" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
          </div>
          <div class="p-8 text-center space-y-4 flex-grow flex flex-col justify-between">
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

    <!-- 4. 我們的服務 (Our Services) 區塊 -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">我們的服務</h2>
        <p class="text-slate-400">專業、安全、有溫度的水下體驗</p>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- 服務 1 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🤿
          </div>
          <h3 class="text-xl font-bold text-white">專業潛水教學</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            從 OW 初階開放水域到 Divemaster 潛水長，嚴格把關安全，用心陪伴每一位學員成長。
          </p>
        </div>

        <!-- 服務 2 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🌊
          </div>
          <h3 class="text-xl font-bold text-white">國內外潛旅行程</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            帶你跳脫平庸！從小琉球、綠島到西巴丹、斯米蘭、帛琉，一起解鎖夢幻水下地標。
          </p>
        </div>

        <!-- 服務 3 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">
            🏠
          </div>
          <h3 class="text-xl font-bold text-white">潛客棧背包住宿</h3>
          <p class="text-slate-300 text-sm leading-relaxed">
            位於東北角的溫馨基地，提供群友優惠住宿與交誼空間，交流潛水心得不孤單。
          </p>
        </div>
      </div>
    </section>

    <!-- 5. 聯絡與社群 快速卡片區塊 -->
    <section class="bg-gradient-to-r from-slate-900 via-slate-900 to-cyan-950/40 border border-slate-800 rounded-3xl p-8 sm:p-12 text-center space-y-8 shadow-2xl">
      <div class="space-y-3 max-w-2xl mx-auto">
        <h2 class="text-3xl font-bold text-white">準備好開啟你的水下冒險了嗎？</h2>
        <p class="text-slate-300">加入官方 Line 社群取得最新潛旅優惠，或直接與我們聯繫預約課程！</p>
      </div>

      <div class="flex flex-wrap justify-center gap-4">
        <a 
          href="https://line.me/ti/g2/0rGjqpJuPuLP2oemMK9mdojS2C2bE-vFuxwxBw" 
          target="_blank" 
          rel="nofollow noreferrer"
          class="px-8 py-3.5 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-base transition duration-300 shadow-lg shadow-emerald-600/20"
        >
          加入 Line 官方社群 ↗
        </a>
        <a 
          href="/contact" 
          class="px-8 py-3.5 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold text-base transition duration-300 shadow-lg shadow-cyan-600/20"
        >
          聯絡我們 Contact ➔
        </a>
      </div>
    </section>

  </div>
</Layout>
FILE_EOF

# 本地打包測試
npm run build

# Git 提交與推播
git add src/pages/index.astro
git commit -m "Restore full home page sections with Fun Dive signup above services" || true
git push origin main

echo "✨ 完成！首頁所有原始資訊已完整保留並成功部署！"
