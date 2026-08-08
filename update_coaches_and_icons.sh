#!/bin/bash
set -e
echo "🎨 正在注入教練介紹與全站 SVG 社群 Icon..."

# 1. 寫入全站通用 Layout.astro (包含官方 SVG 社群 Icon)
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
    <div class="bg-gradient-to-r from-slate-950 via-ocean-900 to-slate-950 text-cyan-300 text-xs py-2.5 px-4 border-b border-cyan-500/10">
      <div class="max-w-7xl mx-auto flex flex-col sm:flex-row justify-between items-center gap-2">
        <div class="flex items-center gap-2">
          <span class="inline-block w-2 h-2 rounded-full bg-cyan-400 animate-pulse"></span>
          <span>📍 新北市瑞芳區洞頂路136-6號 ｜ 📞 +886-921-167-406</span>
        </div>
        <div class="flex items-center gap-4">
          <!-- Facebook Icon -->
          <a href="https://www.facebook.com/profile.php?id=61559833718251" target="_blank" class="hover:text-white transition flex items-center gap-1">
            <svg class="w-3.5 h-3.5 fill-current" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
            <span>FB</span>
          </a>
          <!-- Instagram Icon -->
          <a href="https://www.instagram.com/fun4_diving" target="_blank" class="hover:text-white transition flex items-center gap-1">
            <svg class="w-3.5 h-3.5 fill-current" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
            <span>IG</span>
          </a>
          <!-- LINE Icon -->
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="hover:text-white transition flex items-center gap-1">
            <svg class="w-3.5 h-3.5 fill-current text-emerald-400" viewBox="0 0 24 24"><path d="M19.365 9.863c.349 0 .63.285.63.631 0 .345-.281.63-.63.63H17.61v1.125h1.755c.349 0 .63.283.63.63 0 .344-.281.629-.63.629h-2.386c-.345 0-.627-.285-.627-.629V8.108c0-.345.282-.63.63-.63h2.386c.346 0 .627.285.627.63 0 .349-.281.63-.63.63H17.61v1.125h1.755zm-3.855 3.016c0 .27-.174.51-.432.596-.064.021-.133.031-.199.031-.211 0-.412-.105-.531-.282l-2.008-2.977v2.632c0 .345-.281.63-.627.63-.349 0-.63-.285-.63-.63V8.108c0-.27.174-.51.432-.596.064-.021.133-.031.199-.031.211 0 .412.105.531.282l2.008 2.977V8.108c0-.345.281-.63.627-.63.349 0 .63.285.63.63v4.771zm-5.741 0c0 .345-.282.63-.63.63-.345 0-.627-.285-.627-.63V8.108c0-.345.282-.63.63-.63.345 0 .627.285.627.63v4.771zm-2.428 0h-1.755V8.108c0-.345-.282-.63-.63-.63-.345 0-.627.285-.627.63v4.771c0 .345.282.63.63.63h2.382c.346 0 .627-.285.627-.63 0-.349-.281-.63-.627-.63zM24 10.314c0-5.185-5.383-9.397-12-9.397-6.616 0-12 4.212-12 9.397 0 4.643 4.272 8.52 10.047 9.252.391.084.924.258 1.059.592.122.302.079.775.038 1.082l-.164 1.026c-.045.28-.216 1.092.957.596 1.173-.496 6.331-3.728 8.641-6.382C22.955 14.887 24 12.75 24 10.314z"/></svg>
            <span>LINE</span>
          </a>
          <!-- WhatsApp Icon -->
          <a href="https://wa.me/+886921167406" target="_blank" class="hover:text-white transition flex items-center gap-1">
            <svg class="w-3.5 h-3.5 fill-current text-green-400" viewBox="0 0 24 24"><path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338 11.892-11.893 11.892-1.99 0-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.198-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165-.173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.075-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1.016-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.712.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/></svg>
            <span>WhatsApp</span>
          </a>
        </div>
      </div>
    </div>

    <!-- 玻璃擬態導覽列 -->
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
          <a href="/fun4diving-website/about" class="hover:text-cyan-400 transition">關於我們與團隊</a>
          <a href="/fun4diving-website/news" class="hover:text-cyan-400 transition">最新消息</a>
          <a href="/fun4diving-website/courses" class="hover:text-cyan-400 transition">潛水課程與住宿</a>
          <a href="/fun4diving-website/schedule" class="hover:text-cyan-400 transition">活動列表</a>
          <a href="/fun4diving-website/contact" class="bg-gradient-to-r from-cyan-500 to-blue-600 text-slate-950 px-4 py-2 rounded-lg font-bold shadow-md shadow-cyan-500/20 hover:shadow-cyan-500/40 hover:scale-105 transition">聯絡我們</a>
        </nav>
      </div>
    </header>

    <main class="flex-grow">
      <slot />
    </main>

    <!-- 質感頁尾 -->
    <footer class="bg-[#030712] text-slate-400 py-12 px-4 border-t border-slate-800/80 text-sm">
      <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 mb-12">
        <div class="md:col-span-2 space-y-4">
          <div class="flex items-center gap-2">
            <span class="text-xl font-bold text-white">Fun肆潛水 Fun 4 Diving Club</span>
            <span class="text-xs text-cyan-400 bg-cyan-950/80 px-2 py-0.5 rounded border border-cyan-800/50">放肆水域休閒運動</span>
          </div>
          <p class="text-slate-400 text-sm leading-relaxed max-w-md">
            秉持以潛會友的初衷，由專業教練團隊提供水肺潛水體驗、證照課程、裝備保養修護、背包客房住宿與國內外 Fun Dive 行程。
          </p>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4 tracking-wider text-base border-l-2 border-cyan-400 pl-2">快速連結</h3>
          <ul class="space-y-2.5 text-sm">
            <li><a href="/fun4diving-website/about" class="hover:text-cyan-400 transition">教練與品牌簡介</a></li>
            <li><a href="/fun4diving-website/courses" class="hover:text-cyan-400 transition">潛水課程與住宿</a></li>
            <li><a href="/fun4diving-website/schedule" class="hover:text-cyan-400 transition">近期行程 Schedule</a></li>
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
        <div>© {new Date().getFullYear()} Fun肆潛水 放肆水域休閒運動. All rights reserved.</div>
        <div class="text-slate-600">Designed with passion for the ocean.</div>
      </div>
    </footer>
  </body>
</html>
FILE_EOF

# 2. 重寫【關於我們與教練團隊】 src/pages/about.astro
cat << 'FILE_EOF' > src/pages/about.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="關於我們與教練團隊">
  <section class="max-w-5xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-16">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">About Us & Instructor</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">關於 Fun肆潛水 與 教練團隊</h1>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <!-- 教練介紹卡片 -->
    <div class="bg-gradient-to-br from-slate-900 via-slate-900/90 to-ocean-900 p-8 sm:p-12 rounded-3xl border border-cyan-500/20 shadow-2xl space-y-8 mb-12">
      <div class="flex flex-col md:flex-row gap-8 items-center">
        <div class="w-32 h-32 sm:w-40 sm:h-40 rounded-full bg-cyan-500/10 border-2 border-cyan-400/40 flex items-center justify-center text-5xl shrink-0 shadow-xl shadow-cyan-500/10">
          🥽
        </div>
        <div class="space-y-3 text-center md:text-left">
          <div class="flex flex-wrap items-center justify-center md:justify-start gap-3">
            <h2 class="text-2xl sm:text-3xl font-black text-white">宋文煒 (Jimi) 教練</h2>
            <span class="text-xs text-cyan-300 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold">Fun肆潛水 創辦人</span>
          </div>
          <p class="text-cyan-400 text-sm font-medium">放肆水域休閒運動 ｜ 專業潛水教練 ｜ 潛水裝備檢修專業</p>
          <p class="text-slate-300 text-sm leading-relaxed">
            擁有豐富教學與帶潛經驗，專精水肺潛水教學、潛水裝備保養與修護（包含 SCUBAPRO、Aqualung 等多品牌調節器與 BCD 檢修）。堅持注重細節與最高安全標準，帶領每位學員安心探索海底世界。
          </p>
        </div>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-6 border-t border-slate-800 text-center">
        <div class="p-4 bg-slate-950/60 rounded-xl border border-slate-800">
          <div class="text-cyan-400 font-bold mb-1">以潛會友</div>
          <p class="text-xs text-slate-400">打造沒有距離感的潛水社群，讓潛友們互相交流分享。</p>
        </div>
        <div class="p-4 bg-slate-950/60 rounded-xl border border-slate-800">
          <div class="text-cyan-400 font-bold mb-1">安全第一</div>
          <p class="text-xs text-slate-400">嚴格掌握潛水安全規範與裝備狀態，安心下水無後顧之憂。</p>
        </div>
        <div class="p-4 bg-slate-950/60 rounded-xl border border-slate-800">
          <div class="text-cyan-400 font-bold mb-1">專業裝備支援</div>
          <p class="text-xs text-slate-400">提供完整設備保養、氣瓶充填與優質租借體驗。</p>
        </div>
      </div>
    </div>

    <!-- 品牌理念區塊 -->
    <div class="bg-slate-900/80 p-8 sm:p-10 rounded-2xl border border-slate-800 text-slate-300 space-y-6 leading-relaxed">
      <h3 class="text-2xl font-bold text-white border-l-4 border-cyan-400 pl-3">品牌理念</h3>
      <p>
        Fun肆潛水 (放肆水域休閒運動) 成立於東北角瑞芳洞頂路，我們不只是提供潛水證照考取，更致力於打造一個溫暖、充滿人情味的潛水聚落。
      </p>
      <p>
        從初次下水的體驗潛水、OW/AOW 證照班，到離島與國外如 Puerto Galera (PG島) 的 Fun Dive 行程，我們期待陪著你一起成長，告別潛水孤兒，放肆享受藍色大海的魅力！
      </p>
    </div>
  </section>
</Layout>
FILE_EOF

# 3. 推送到 GitHub 觸發建置
echo "🚀 正在將最新教練介紹與全站 SVG Icon 推送至 GitHub..."
git add .
git commit -m "Add instructor info, branding and SVG icons for social media" || true
git push origin main --force

echo "✨ 更新完成！"
