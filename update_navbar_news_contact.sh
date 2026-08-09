#!/bin/bash
set -e
echo "🔧 正在更新 Layout.astro 導覽列：新增『最新消息 News』選單，並將『聯絡我們 Contact』修正連結至 /contact..."

cat << 'FILE_EOF' > src/layouts/Layout.astro
---
interface Props {
  title: string;
}

const { title } = Astro.props;
const pathname = Astro.url.pathname;
---

<!DOCTYPE html>
<html lang="zh-TW" class="scroll-smooth">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <meta name="generator" content={Astro.generator} />
    <title>{title}</title>
  </head>
  <body class="bg-slate-950 text-slate-100 min-h-screen flex flex-col font-sans antialiased">
    
    <!-- 頂部導覽列 Header Navigation -->
    <header class="sticky top-0 z-40 bg-slate-950/90 backdrop-blur-md border-b border-slate-800/80 shadow-2xl">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 h-16 sm:h-20 flex items-center justify-between">
        <!-- Logo -->
        <a href="/" class="flex items-center gap-2 group">
          <span class="text-xl sm:text-2xl font-black text-white tracking-wider group-hover:text-cyan-400 transition duration-300">
            FUN肆潛水
          </span>
        </a>

        <!-- 主選單連結 (新增 最新消息 + 修正 聯絡我們 為 /contact) -->
        <nav class="hidden md:flex items-center gap-2 sm:gap-3 text-xs sm:text-sm font-medium">
          <a 
            href="/" 
            class={`px-3.5 py-2 rounded-full border transition-all duration-300 ${
              pathname === '/' 
                ? 'bg-cyan-500/20 text-cyan-300 border-cyan-400/50 shadow-lg shadow-cyan-500/10 font-bold' 
                : 'text-slate-300 border-transparent hover:text-white hover:bg-slate-800 hover:border-slate-700'
            }`}
          >
            首頁 Index
          </a>
          <a 
            href="/courses" 
            class={`px-3.5 py-2 rounded-full border transition-all duration-300 ${
              pathname.startsWith('/courses') 
                ? 'bg-cyan-500/20 text-cyan-300 border-cyan-400/50 shadow-lg shadow-cyan-500/10 font-bold' 
                : 'text-slate-300 border-transparent hover:text-white hover:bg-slate-800 hover:border-slate-700'
            }`}
          >
            課程與住宿 Course
          </a>
          <a 
            href="/schedule" 
            class={`px-3.5 py-2 rounded-full border transition-all duration-300 ${
              pathname.startsWith('/schedule') 
                ? 'bg-cyan-500/20 text-cyan-300 border-cyan-400/50 shadow-lg shadow-cyan-500/10 font-bold' 
                : 'text-slate-300 border-transparent hover:text-white hover:bg-slate-800 hover:border-slate-700'
            }`}
          >
            潛旅與活動 Schedule
          </a>
          <a 
            href="/news" 
            class={`px-3.5 py-2 rounded-full border transition-all duration-300 ${
              pathname.startsWith('/news') 
                ? 'bg-cyan-500/20 text-cyan-300 border-cyan-400/50 shadow-lg shadow-cyan-500/10 font-bold' 
                : 'text-slate-300 border-transparent hover:text-white hover:bg-slate-800 hover:border-slate-700'
            }`}
          >
            最新消息 News
          </a>
          <a 
            href="/contact" 
            class={`px-3.5 py-2 rounded-full border transition-all duration-300 ${
              pathname.startsWith('/contact') 
                ? 'bg-cyan-500/20 text-cyan-300 border-cyan-400/50 shadow-lg shadow-cyan-500/10 font-bold' 
                : 'text-slate-300 border-transparent hover:text-white hover:bg-slate-800 hover:border-slate-700'
            }`}
          >
            聯絡我們 Contact
          </a>
        </nav>
      </div>
    </header>

    <!-- 主要頁面內容 -->
    <main class="flex-grow">
      <slot />
    </main>

    <!-- 右下角常駐縮小版浮動 LINE 諮詢按鈕 -->
    <a 
      href="http://lin.ee/lSvAOy4" 
      target="_blank" 
      rel="nofollow noreferrer"
      aria-label="LINE 快速諮詢"
      class="fixed bottom-5 right-5 z-50 flex items-center gap-2 bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs sm:text-sm px-3.5 py-2.5 sm:px-4 sm:py-2.5 rounded-full shadow-xl shadow-emerald-600/40 border border-emerald-400/40 transform hover:scale-105 transition-all duration-300"
    >
      <span class="relative flex h-2.5 w-2.5">
        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-300 opacity-75"></span>
        <span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-white"></span>
      </span>
      <span>💬 LINE 諮詢</span>
    </a>

    <!-- 頁尾 Footer -->
    <footer class="bg-slate-950 border-t border-slate-800/80 py-12 px-4 sm:px-6 text-center text-slate-400 text-sm space-y-4">
      <div class="max-w-7xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-4">
        <div class="space-y-1 text-left">
          <p class="font-bold text-white text-base">Fun肆潛水 Fun 4 Diving</p>
          <p class="text-xs text-slate-400">東北角 Fun Dive 第一店 ‧ 專業導潛 ‧ 潛水課程 ‧ 背包客房</p>
        </div>
        <div class="flex items-center gap-4 text-xs text-slate-300">
          <a href="/courses" class="hover:text-cyan-400">課程住宿</a>
          <span>•</span>
          <a href="/schedule" class="hover:text-cyan-400">行程預約</a>
          <span>•</span>
          <a href="/contact" class="hover:text-cyan-400">聯絡我們</a>
          <span>•</span>
          <a href="http://lin.ee/lSvAOy4" target="_blank" rel="nofollow noreferrer" class="hover:text-emerald-400">LINE 社群</a>
        </div>
      </div>
      <div class="text-xs text-slate-400 pt-6 border-t border-slate-900">
        © {new Date().getFullYear()} Fun 4 Diving Official. All rights reserved.
      </div>
    </footer>

  </body>
</html>
FILE_EOF

# 本地建置測試
npm run build

# Git 提交並自動推送至 GitHub
git add . && git commit -m "Add News link to navbar and update Contact link to /contact" && git push origin main

echo "✨ 完成！導覽列已加入『最新消息 News』，並將『聯絡我們』正確連接至 /contact！"
