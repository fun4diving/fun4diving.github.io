#!/bin/bash
set -e
echo "📝 正在將 Contact 頁面內容寫入 src/pages/contact.astro..."

cat << 'FILE_EOF' > src/pages/contact.astro
---
import Layout from '../layouts/Layout.astro';

const socialLinks = [
  {
    name: "LINE",
    url: "https://lin.ee/lSvAOy4",
    icon: "https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000052-6137b6137d/LINE_logo.svg-1.png",
    color: "hover:border-emerald-500"
  },
  {
    name: "Instagram",
    url: "https://www.instagram.com/fun4_diving?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    icon: "https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000058-04c3b04c3d/Instagram_icon.png",
    color: "hover:border-pink-500"
  },
  {
    name: "Facebook",
    url: "https://www.facebook.com/profile.php?id=61559833718251",
    icon: "https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000060-8983189834/f909d9f1202402d8d9f5f0ccc0a72a87.png",
    color: "hover:border-blue-500"
  },
  {
    name: "WhatsApp",
    url: "https://wa.me/+886921167406",
    icon: "https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000062-3c36d3c36f/whatsapp-logo-png-transparent-images-thumbnail-1704553855.png",
    color: "hover:border-green-500"
  }
];
---

<Layout title="聯絡我們 Contact :: Fun肆潛水-Fun 4 Diving Official">
  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-12">
    
    <!-- 頁面頂部標題區 -->
    <div class="text-center space-y-4">
      <h1 class="text-4xl sm:text-5xl font-black text-white tracking-tight">聯絡我們</h1>
      <p class="text-cyan-400 font-medium tracking-wide">Contact</p>
      <div class="w-20 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <!-- 主內容區：地圖 + 聯絡資訊 -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
      
      <!-- 左側：Google 地圖 -->
      <div class="lg:col-span-7 bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden shadow-xl h-[350px] sm:h-[450px] relative">
        <iframe 
          src="https://web-2022.webnode.it/widgets/googlemaps/?z=15&a=22451%E6%96%B0%E5%8C%97%E5%B8%82%E7%91%9E%E8%8A%B3%E5%8D%80%E6%B4%9E%E9%A0%82%E8%B7%AF136-6%E8%99%9F" 
          class="w-full h-full border-0" 
          loading="lazy"
          title="Fun肆潛水位置地圖"
        ></iframe>
      </div>

      <!-- 右側：詳細聯絡資料與社群 -->
      <div class="lg:col-span-5 space-y-6">
        
        <!-- 聯絡文字資訊 -->
        <div class="bg-slate-900/90 rounded-2xl border border-slate-800 p-6 sm:p-8 space-y-6 shadow-xl">
          
          <!-- 地址 -->
          <div class="flex items-start gap-4">
            <div class="p-3 bg-cyan-500/10 rounded-xl border border-cyan-500/20 text-cyan-400 shrink-0">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
              </svg>
            </div>
            <div>
              <div class="text-xs text-slate-400 font-semibold tracking-wider">ADDRESS</div>
              <div class="text-white font-bold text-lg leading-snug mt-0.5">22451 新北市瑞芳區洞頂路136-6號</div>
            </div>
          </div>

          <!-- 電話 1 -->
          <div class="flex items-start gap-4">
            <div class="p-3 bg-cyan-500/10 rounded-xl border border-cyan-500/20 text-cyan-400 shrink-0">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
              </svg>
            </div>
            <div>
              <div class="text-xs text-slate-400 font-semibold tracking-wider">PHONE 1</div>
              <a href="tel:+886921167406" class="text-white font-bold text-lg hover:text-cyan-400 transition font-mono mt-0.5 block">
                +886-921-167-406
              </a>
            </div>
          </div>

          <!-- 電話 2 -->
          <div class="flex items-start gap-4">
            <div class="p-3 bg-cyan-500/10 rounded-xl border border-cyan-500/20 text-cyan-400 shrink-0">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
              </svg>
            </div>
            <div>
              <div class="text-xs text-slate-400 font-semibold tracking-wider">PHONE 2</div>
              <a href="tel:+886952431617" class="text-white font-bold text-lg hover:text-cyan-400 transition font-mono mt-0.5 block">
                +886-952-431-617
              </a>
            </div>
          </div>

          <!-- Email -->
          <div class="flex items-start gap-4">
            <div class="p-3 bg-cyan-500/10 rounded-xl border border-cyan-500/20 text-cyan-400 shrink-0">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
              </svg>
            </div>
            <div>
              <div class="text-xs text-slate-400 font-semibold tracking-wider">E-MAIL</div>
              <a href="mailto:fun4divingofficial@gmail.com" class="text-white font-bold text-base sm:text-lg hover:text-cyan-400 transition break-all mt-0.5 block">
                fun4divingofficial@gmail.com
              </a>
            </div>
          </div>

        </div>

        <!-- 社群平台快捷按鈕 -->
        <div class="grid grid-cols-4 gap-4">
          {socialLinks.map((item) => (
            <a 
              href={item.url} 
              target="_blank" 
              rel="nofollow noreferrer"
              class={`bg-slate-900 border border-slate-800 p-3 sm:p-4 rounded-2xl flex flex-col items-center justify-center gap-2 hover:scale-105 transition duration-300 shadow-lg ${item.color}`}
              title={item.name}
            >
              <img src={item.icon} alt={item.name} class="w-10 h-10 object-contain" />
              <span class="text-xs font-semibold text-slate-300">{item.name}</span>
            </a>
          ))}
        </div>

      </div>

    </div>

  </div>
</Layout>
FILE_EOF

# 本地 build 測試
echo "🧪 正在進行本地 build 測試..."
npm run build

echo "🚀 推送修改至 GitHub..."
git add src/pages/contact.astro
git commit -m "Update Contact page to 100% match Webnode raw HTML content" || true
git push origin main --force

echo "✨ 更新完成！聯絡我們頁面已成功同步！"
