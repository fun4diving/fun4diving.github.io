#!/bin/bash
set -e
echo "🎨 正在更新 index.astro Hero 門面區塊：融入『東北角Fun Dive第一店』，其餘區塊完全不動..."

cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="首頁 Index :: Fun肆潛水-Fun 4 Diving Official">
  
  <!-- 1. 全新沉浸式冒險 Hero 門面區塊 (融入：東北角Fun Dive第一店) -->
  <section class="relative min-h-[85vh] sm:min-h-[750px] flex items-center justify-center overflow-hidden py-20 px-4 sm:px-6">
    <!-- 背景大圖 (水下合照，附帶流暢深海暗色漸層遮罩) -->
    <div class="absolute inset-0 z-0">
      <img 
        src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000008-7b6a07b6a2/S__106807390.jpeg" 
        alt="Fun肆潛水 海洋冒險" 
        class="w-full h-full object-cover object-center filter brightness-60 scale-105"
      />
      <!-- 上下漸層優化 readability -->
      <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/30 to-slate-950/70"></div>
    </div>

    <!-- 主視覺內容容器 -->
    <div class="relative z-10 max-w-5xl mx-auto text-center space-y-8">
      
      <!-- 1. 頂部品質標籤 (融入：東北角Fun Dive第一店) -->
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-cyan-500/20 border border-cyan-400/40 text-cyan-300 font-bold text-xs sm:text-sm tracking-widest backdrop-blur-md uppercase shadow-lg">
        🏆 東北角Fun Dive第一店 ‧ Explore The Blue Universe
      </div>

      <!-- 2. 喚醒冒險慾的主標題 -->
      <h1 class="text-4xl sm:text-6xl lg:text-7xl font-black text-white tracking-tight drop-shadow-2xl leading-tight">
        釋放渴望，<span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-sky-300 to-blue-500">FUN 肆入海！</span>
      </h1>

      <!-- 3. 精簡感染力文案 (融入：東北角Fun Dive第一店) -->
      <p class="text-slate-100 leading-relaxed text-lg sm:text-2xl max-w-3xl mx-auto font-light drop-shadow-md">
        東北角Fun Dive第一店！水下沒有喧囂，只有呼吸與湛藍的自由。<br class="hidden sm:inline" />
        嚴守安全底線、玩出熱血極限——準備好跟我們一起探索大海了嗎？
      </p>

      <!-- 4. 極簡品質認證卡片 (玻璃擬物風格) -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 max-w-3xl mx-auto pt-2">
        <div class="bg-slate-900/60 backdrop-blur-md p-4 rounded-2xl border border-white/10 text-center space-y-1 shadow-xl hover:border-cyan-400/50 transition">
          <div class="text-cyan-400 font-bold text-base sm:text-lg">🤿 專業 PADI 教練</div>
          <div class="text-slate-300 text-xs">嚴格把關水下安全品質</div>
        </div>
        <div class="bg-slate-900/60 backdrop-blur-md p-4 rounded-2xl border border-white/10 text-center space-y-1 shadow-xl hover:border-cyan-400/50 transition">
          <div class="text-cyan-400 font-bold text-base sm:text-lg">🌊 國內外熱門潛旅</div>
          <div class="text-slate-300 text-xs">小琉球/綠島/帛琉/西巴丹</div>
        </div>
        <div class="bg-slate-900/60 backdrop-blur-md p-4 rounded-2xl border border-white/10 text-center space-y-1 shadow-xl hover:border-cyan-400/50 transition">
          <div class="text-cyan-400 font-bold text-base sm:text-lg">🏠 東北角背包客房</div>
          <div class="text-slate-300 text-xs">溫馨乾淨的潛友棲息基地</div>
        </div>
      </div>

      <!-- 5. 高轉換率雙行動按鈕 (Dual CTA) -->
      <div class="pt-6 flex flex-col sm:flex-row items-center justify-center gap-4 sm:gap-6">
        <a 
          href="/schedule" 
          class="w-full sm:w-auto px-8 py-4 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-black text-lg sm:text-xl hover:scale-105 transition duration-300 shadow-2xl shadow-cyan-500/40 text-center"
        >
          🔥 預約最新潛旅行程 ➔
        </a>
        <a 
          href="http://lin.ee/lSvAOy4" 
          target="_blank" 
          rel="nofollow noreferrer"
          class="w-full sm:w-auto px-8 py-4 rounded-xl bg-slate-900/80 hover:bg-emerald-600 text-white border border-emerald-500/50 font-bold text-lg sm:text-xl transition duration-300 shadow-xl backdrop-blur-md text-center"
        >
          💬 LINE 專人快速諮詢 ↗
        </a>
      </div>

    </div>
  </section>

  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-20">

    <!-- 2. Fun Dive 報名資訊 (保持完全不動) -->
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
            <div class="space-y-1">
              <h3 class="text-xl font-bold text-white">東北角岸潛說明及報名表單</h3>
              <p class="text-xs text-cyan-400 font-medium tracking-wider">Shore Diving Form</p>
            </div>
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
            <div class="space-y-1">
              <h3 class="text-xl font-bold text-white">東北角船潛報名表單</h3>
              <p class="text-xs text-cyan-400 font-medium tracking-wider">Boat Diving Form</p>
            </div>
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

    <!-- 3. 我們的服務 (保持完全不動) -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">我們的服務</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">🤿</div>
          <h3 class="text-lg font-bold text-white">Fun Dive、潛水課程、體驗潛水</h3>
          <p class="text-slate-300 text-sm leading-relaxed">不論是體驗潛水、各階段潛水課程、更不可錯過Fun肆著名的Fun Dive行程。</p>
        </div>

        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">🌊</div>
          <h3 class="text-lg font-bold text-white">國內外潛水行程</h3>
          <p class="text-slate-300 text-sm leading-relaxed">東北角、墾丁、小琉球、綠島、蘭嶼、還有所有的國外潛水行程，本著以潛會友的宗旨。</p>
        </div>

        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">⚓</div>
          <h3 class="text-lg font-bold text-white">氣瓶、裝備租借</h3>
          <p class="text-slate-300 text-sm leading-relaxed">所有水肺裝備、氣瓶、蛙鞋、面鏡等等以及自潛裝備租借，在最方便的位置讓您先租好裝備，有好的裝備才好安心下水。</p>
        </div>

        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 space-y-4 hover:border-cyan-500/40 transition duration-300 shadow-xl">
          <div class="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center text-cyan-400 text-2xl font-bold">🏠</div>
          <h3 class="text-lg font-bold text-white">背包客房</h3>
          <p class="text-slate-300 text-sm leading-relaxed">舒適的空間讓您在旅程中能好好的放鬆心情，提供您像家一樣的感受。</p>
        </div>
      </div>
    </section>

    <!-- 4. 課程及行程詳細內容 (保持完全不動) -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">課程及行程詳細內容</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
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
            <a href="/courses" class="inline-block px-8 py-3 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold transition duration-300 shadow-lg">了解更多</a>
          </div>
        </div>

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
            <a href="/schedule" class="inline-block px-8 py-3 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold transition duration-300 shadow-lg">了解更多</a>
          </div>
        </div>
      </div>
    </section>

    <!-- 5. 最新消息 (保持完全不動) -->
    <section class="space-y-8">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">最新消息</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="space-y-6">
        <div class="bg-slate-900/90 rounded-2xl border border-slate-800 p-6 sm:p-8 flex flex-col md:flex-row gap-6 items-center shadow-xl">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000020-c03cfc03d1/S__106807414.jpeg" 
            alt="加入Line社群" 
            class="w-full md:w-72 h-48 object-cover rounded-xl shrink-0"
          />
          <div class="space-y-4 flex-grow w-full">
            <h3 class="text-2xl font-bold text-white leading-snug">
              加入Line社群可享群友優惠並即時獲得最新行程資訊
            </h3>
            <p class="text-slate-300 text-sm leading-relaxed">
              透過以下連結加入Line社群即可獲得群友優惠，並第一時間最快取得最新行程資訊！同時快速結交潛友，告別潛水孤兒生涯！推薦人輸入：官方網站。
            </p>
            <div class="pt-2">
              <a 
                href="http://lin.ee/lSvAOy4" 
                target="_blank" 
                rel="nofollow noreferrer"
                class="inline-block px-6 py-2.5 rounded-full bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-sm transition duration-300 shadow-lg shadow-emerald-600/20"
              >
                加入 Line 社群優惠 ↗
              </a>
            </div>
          </div>
        </div>

        <div class="bg-slate-900/90 rounded-2xl border border-slate-800 p-6 sm:p-8 flex flex-col md:flex-row gap-6 items-center shadow-xl">
          <img 
            src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000050-7a23d7a23e/S__106807392.jpeg" 
            alt="OW、AOW課程團報特價" 
            class="w-full md:w-72 h-48 object-cover rounded-xl shrink-0"
          />
          <div class="space-y-4 flex-grow w-full">
            <h3 class="text-2xl font-bold text-white leading-snug">
              OW、AOW課程團報特價
            </h3>
            <p class="text-slate-300 text-sm leading-relaxed">
              即日起滿三人團報OW、AOW課程每人特價折扣1000元，高氧潛水員課程限時優惠折扣500元！
            </p>
            <div class="pt-2">
              <a 
                href="/courses" 
                class="inline-block px-6 py-2.5 rounded-full bg-cyan-600 hover:bg-cyan-500 text-white font-bold text-sm transition duration-300 shadow-lg shadow-cyan-600/20"
              >
                查看課程與優惠 ➔
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

  </div>
</Layout>
FILE_EOF

# 本地打包測試
npm run build

# Git 提交並自動推送至 GitHub
git add . && git commit -m "Update Hero section with '東北角Fun Dive第一店' and 4 core design principles" && git push origin main

echo "✨ 更新完成！『東北角Fun Dive第一店』已完美融入 Hero 門面，其餘區塊完全保留，並已自動發布上線！"
