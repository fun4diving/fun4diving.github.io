#!/bin/bash
set -e
echo "📝 正在還原 courses.astro 完整原本內容，並加入『Fun肆背包房住宿預約』卡片..."

cat << 'FILE_EOF' > src/pages/courses.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="課程與住宿 Course & Hostel :: Fun肆潛水-Fun 4 Diving Official">
  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-20">
    
    <!-- 頁面頂部標題區 -->
    <div class="text-center space-y-4">
      <h1 class="text-4xl sm:text-5xl font-black text-white tracking-tight">潛水課程與住宿</h1>
      <p class="text-cyan-400 font-medium tracking-wide">Course & Hostel</p>
      <div class="w-20 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <!-- 1. 報名與預約表單三大卡片區塊 -->
    <section class="space-y-8 bg-slate-900/60 p-6 sm:p-10 rounded-3xl border border-cyan-500/20 shadow-2xl">
      <div class="text-center space-y-2">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">東北角行程與住宿預約</h2>
        <p class="text-cyan-400 font-medium">點擊下方按鈕可直接開啟線上預約表單</p>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 pt-4">
        <!-- 卡片 1：岸潛報名 -->
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

        <!-- 卡片 2：船潛報名 -->
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

        <!-- 卡片 3：Fun肆背包房住宿預約 (全新新增) -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl flex flex-col group hover:border-cyan-500/50 transition duration-300">
          <div class="h-60 sm:h-64 overflow-hidden relative">
            <img 
              src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000020-c03cfc03d1/S__106807414.jpeg" 
              alt="Fun肆背包房住宿預約" 
              class="w-full h-full object-cover object-center group-hover:scale-105 transition duration-500"
            />
          </div>
          <div class="p-6 text-center space-y-4 flex-grow flex flex-col justify-between">
            <h3 class="text-xl font-bold text-white">Fun肆背包房住宿預約</h3>
            <div>
              <a 
                href="https://forms.gle/FXt1taoXVwq7CUkAA" 
                target="_blank" 
                rel="nofollow noreferrer"
                class="inline-block px-6 py-3 rounded-xl bg-gradient-to-r from-amber-500 to-orange-600 text-white font-bold hover:scale-105 transition duration-300 shadow-lg shadow-amber-500/20"
              >
                前往填寫住宿預約表 ↗
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 2. 原本完整課程內容與詳細定價 -->
    <section class="space-y-12">
      <div class="text-center space-y-3">
        <h2 class="text-3xl sm:text-4xl font-black text-white tracking-tight">潛水課程價目表</h2>
        <div class="w-16 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- OW 課程 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-6 shadow-xl flex flex-col justify-between">
          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <h3 class="text-2xl font-bold text-white">OW 初階開放水域潛水員</h3>
              <span class="px-3 py-1 rounded-full text-xs font-bold bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">零基礎推薦</span>
            </div>
            <p class="text-slate-300 text-sm leading-relaxed">
              踏入湛藍水世界的第一步！學習完整的潛水理論、平靜水域技巧與開放水域實作，取得全球通用的國際潛水證照。
            </p>
            <div class="border-t border-slate-800 pt-4 space-y-2">
              <div class="text-cyan-400 font-bold text-2xl">NT$ 13,000 / 人</div>
              <p class="text-xs text-slate-400">三人以上同行團報，每人現折 NT$ 1,000</p>
            </div>
          </div>
        </div>

        <!-- AOW 課程 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-6 shadow-xl flex flex-col justify-between">
          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <h3 class="text-2xl font-bold text-white">AOW 進階開放水域潛水員</h3>
              <span class="px-3 py-1 rounded-full text-xs font-bold bg-blue-500/10 text-blue-400 border border-blue-500/30">進階解鎖</span>
            </div>
            <p class="text-slate-300 text-sm leading-relaxed">
              解鎖 30 米深度與深潛、頂尖中性浮力、夜潛、水下導航等進階專長，探索更廣闊神秘的大海景致。
            </p>
            <div class="border-t border-slate-800 pt-4 space-y-2">
              <div class="text-cyan-400 font-bold text-2xl">NT$ 13,000 / 人</div>
              <p class="text-xs text-slate-400">三人以上同行團報，每人現折 NT$ 1,000</p>
            </div>
          </div>
        </div>

        <!-- 高氧專长課程 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-6 shadow-xl flex flex-col justify-between">
          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <h3 class="text-2xl font-bold text-white">EANx 滿分高氧空氣專長</h3>
              <span class="px-3 py-1 rounded-full text-xs font-bold bg-emerald-500/10 text-emerald-400 border border-emerald-500/30">必修專長</span>
            </div>
            <p class="text-slate-300 text-sm leading-relaxed">
              延長免減壓極限、降低水下疲勞感！出國潛旅與連潛不可或缺的頂級必備證照。
            </p>
            <div class="border-t border-slate-800 pt-4 space-y-2">
              <div class="text-cyan-400 font-bold text-2xl">NT$ 6,000 / 人</div>
              <p class="text-xs text-slate-400">配合 OW/AOW 課程加購限時折 NT$ 500</p>
            </div>
          </div>
        </div>

        <!-- 體驗潛水 -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-8 space-y-6 shadow-xl flex flex-col justify-between">
          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <h3 class="text-2xl font-bold text-white">Discover Scuba 體驗潛水</h3>
              <span class="px-3 py-1 rounded-full text-xs font-bold bg-amber-500/10 text-amber-400 border border-amber-500/30">免證照體驗</span>
            </div>
            <p class="text-slate-300 text-sm leading-relaxed">
              不用會游泳也能輕鬆體驗！全程專業教練 1 對 1 陪同帶領，含全套裝備，輕鬆紀錄水下寫真！
            </p>
            <div class="border-t border-slate-800 pt-4 space-y-2">
              <div class="text-cyan-400 font-bold text-2xl">NT$ 2,500 / 人</div>
              <p class="text-xs text-slate-400">費用已包含全套裝備租借與水下拍攝紀錄</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 3. 背包客房介紹 -->
    <section class="bg-slate-900/80 p-8 sm:p-12 rounded-3xl border border-slate-800 space-y-6 shadow-2xl">
      <div class="space-y-2">
        <h2 class="text-3xl font-bold text-white">🏠 Fun肆潛客棧 背包客房</h2>
        <p class="text-cyan-400 text-sm font-medium">溫馨乾淨的潛友棲息地</p>
      </div>
      <p class="text-slate-300 leading-relaxed">
        潛水基地提供舒適溫馨的背包客房空間，讓遠道而來的潛友們能夠在充實的潛水日程前後獲得良好的休息與交流。房間設備齊全，設有私人床位遮簾、讀書燈、插座與置物空間，並提供裝備清洗曬衣區！
      </p>
      <div class="pt-2">
        <a 
          href="https://forms.gle/FXt1taoXVwq7CUkAA" 
          target="_blank" 
          rel="nofollow noreferrer"
          class="inline-block px-8 py-3 rounded-xl bg-gradient-to-r from-amber-500 to-orange-600 text-white font-bold text-sm hover:scale-105 transition duration-300 shadow-lg shadow-amber-500/20"
        >
          立即線上預約背包房 ↗
        </a>
      </div>
    </section>

  </div>
</Layout>
FILE_EOF

# 本地打包測試
npm run build

# Git 提交並自動推送至 GitHub
git add . && git commit -m "Restore full courses page content with all pricing details and add hostel card" && git push origin main

echo "✨ 搞定！已完全還原所有課程價目內容，並把背包房預約卡片加入頂部！"
