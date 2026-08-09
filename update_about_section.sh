#!/bin/bash
set -e
echo "🎨 正在美化 index.astro 中的『關於Fun肆』區塊..."

cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="首頁 Index :: Fun肆潛水-Fun 4 Diving Official">
  
  <!-- 1. Hero 頂部主圖區塊 -->
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

  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-24">

    <!-- 2. 美化版：關於Fun肆 區塊 -->
    <section class="relative bg-gradient-to-b from-slate-900/90 via-slate-900/50 to-slate-950 p-8 sm:p-12 rounded-3xl border border-cyan-500/20 shadow-2xl overflow-hidden">
      <!-- 背景海洋微光特效 -->
      <div class="absolute -top-24 -right-24 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl pointer-events-none"></div>
      
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center relative z-10">
        <!-- 左側文案區塊 (7 欄) -->
        <div class="lg:col-span-7 space-y-6">
          <div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-cyan-500/10 border border-cyan-500/30 text-cyan-400 font-semibold text-xs tracking-wider">
            <span>✨</span> ABOUT FUN 4 DIVING
          </div>
          
          <h2 class="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight leading-tight">
            探索水下湛藍世界，<br class="hidden sm:inline" /><span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-500">盡情 FUN 肆悠遊</span>
          </h2>
          
          <p class="text-slate-300 leading-relaxed text-base sm:text-lg font-light">
            我們是一群熱愛海洋、致力於推廣安全與趣味潛水的專業團隊。無論你是初接觸體驗潛水的新手，還是追求更高技術的熱血潛友，Fun肆潛水都能提供最嚴格把關的教學、貼心的行程規劃與安心的水下體驗。
          </p>

          <!-- 亮點小卡片 -->
          <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
            <div class="bg-slate-950/60 p-4 rounded-xl border border-slate-800 text-center sm:text-left space-y-1">
              <div class="text-cyan-400 font-bold text-lg">🤿 專業教學</div>
              <div class="text-slate-400 text-xs">嚴格把關安全品質</div>
            </div>
            <div class="bg-slate-950/60 p-4 rounded-xl border border-slate-800 text-center sm:text-left space-y-1">
              <div class="text-cyan-400 font-bold text-lg">🌊 豐富潛旅</div>
              <div class="text-slate-400 text-xs">國內外精選景點</div>
            </div>
            <div class="bg-slate-950/60 p-4 rounded-xl border border-slate-800 text-center sm:text-left space-y-1">
              <div class="text-cyan-400 font-bold text-lg">🏠 溫馨基地</div>
              <div class="text-slate-400 text-xs">東北角背包客房</div>
            </div>
          </div>

          <div class="pt-4">
            <a 
              href="/about" 
              class="inline-flex items-center gap-2 px-8 py-3.5 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold hover:scale-105 transition duration-300 shadow-lg shadow-cyan-500/20"
            >
              了解更多我們的故事 →
            </a>
          </div>
        </div>

        <!-- 右側精美圖片區塊 (5 欄) -->
        <div class="lg:col-span-5">
          <div class="relative group">
            <div class="absolute -inset-1 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-2xl blur opacity-30 group-hover:opacity-60 transition duration-500"></div>
            <div class="relative rounded-2xl overflow-hidden border border-slate-700/50 shadow-2xl aspect-[4/3] sm:aspect-[16/10] lg:aspect-[4/3]">
              <img 
                src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000084-2c0072c009/puerto1.jpeg" 
                alt="Fun肆潛水 活動照片" 
                class="w-full h-full object-cover group-hover:scale-105 transition duration-500"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 3. Fun Dive 報名資訊 -->
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

    <!-- 4. 我們的服務 -->
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

    <!-- 5. 課程及行程詳細內容 -->
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
            <a href="/courses" class="inline-block px-8 py-3 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white font-bold transition duration-300 shadow-lg">了解更多</a>
          </div>
        </div>
      </div>
    </section>

    <!-- 6. 最新消息 -->
    <section class="space-y-8">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">最新消息</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="space-y-6">
        <!-- 新聞 1 -->
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

        <!-- 新聞 2 -->
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
git add . && git commit -m "Enhance About section visual styling on homepage" && git push origin main

echo "✨ 升級完成！『關於Fun肆』區塊已美化完畢，程式碼已自動推送發布！"
