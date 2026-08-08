#!/bin/bash
set -e
echo "🎨 正在更新 Layout：移除導覽列圓角外框，改為貼滿螢幕全寬風格..."

cat << 'FILE_EOF' > src/layouts/Layout.astro
---
interface Props {
  title: string;
}

const { title } = Astro.props;

// 導覽選單項目
const navItems = [
  { name: '首頁 Index', href: '/fun4diving-website/' },
  { name: '關於Fun肆潛水', href: '/fun4diving-website/about' },
  { name: '新聞 News', href: '/fun4diving-website/news' },
  { name: '課程與住宿 Course', href: '/fun4diving-website/courses' },
  { name: '聯絡我們 Contact', href: '/fun4diving-website/contact' },
  { name: '活動列表 Schedule', href: '/fun4diving-website/schedule', highlight: true },
];

const currentPath = Astro.url.pathname;
---

<!doctype html>
<html lang="zh-TW" class="dark scroll-smooth">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Fun肆潛水 Fun 4 Diving Official" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <title>{title}</title>
  </head>
  <body class="bg-slate-950 text-slate-100 min-h-screen flex flex-col font-sans antialiased selection:bg-cyan-500 selection:text-white relative">
    
    <!-- 頂部凍結全寬導覽列 (Full-Width Glass Nav) -->
    <header class="sticky top-0 z-50 w-full backdrop-blur-xl bg-slate-900/85 border-b border-slate-800/80 transition-all duration-300">
      <div class="max-w-7xl mx-auto px-4 sm:px-8">
        <div class="flex items-center justify-between h-16 sm:h-20">
          
          <!-- LOGO 區塊 -->
          <a href="/fun4diving-website/" class="flex items-center group py-1">
            <img 
              src="/fun4diving-website/logowhite.png" 
              alt="Fun肆潛水 Logo" 
              class="h-8 sm:h-10 w-auto object-contain transition duration-300 transform group-hover:scale-105"
            />
          </a>

          <!-- 桌機選單 -->
          <nav class="hidden lg:flex items-center gap-1 xl:gap-2">
            {navItems.map((item) => {
              const isActive = currentPath === item.href || (item.href !== '/fun4diving-website/' && currentPath.startsWith(item.href));
              return (
                <a
                  href={item.href}
                  class={`relative px-4 py-2 rounded-xl text-sm font-semibold transition-all duration-300 group ${
                    isActive
                      ? 'text-cyan-300 bg-cyan-950/40 border border-cyan-500/30 shadow-[0_0_15px_rgba(6,182,212,0.15)]'
                      : 'text-slate-300 hover:text-white hover:bg-slate-800/50'
                  } ${item.highlight ? 'bg-gradient-to-r from-cyan-500/10 to-blue-500/10 border border-cyan-500/20 text-cyan-400' : ''}`}
                >
                  {item.name}
                  <span class={`absolute bottom-0 left-1/2 -translate-x-1/2 h-[2px] bg-gradient-to-r from-cyan-400 to-blue-500 transition-all duration-300 rounded-full ${isActive ? 'w-3/4 opacity-100' : 'w-0 opacity-0 group-hover:w-1/2 group-hover:opacity-70'}`}></span>
                </a>
              );
            })}
          </nav>

          <!-- 手機漢堡選單開關按鈕 -->
          <button 
            id="mobile-menu-btn"
            type="button" 
            class="lg:hidden p-2.5 rounded-xl bg-slate-800/80 border border-slate-700/60 text-slate-200 hover:text-white hover:bg-slate-700 focus:outline-none transition active:scale-95"
            aria-label="Toggle Menu"
          >
            <svg id="menu-icon-open" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
            <svg id="menu-icon-close" class="w-6 h-6 hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
          </button>

        </div>

        <!-- 手機展開選單 -->
        <div id="mobile-menu" class="hidden lg:hidden border-t border-slate-800/80 py-4 space-y-1.5 transition-all">
          {navItems.map((item) => {
            const isActive = currentPath === item.href;
            return (
              <a
                href={item.href}
                class={`block px-4 py-3 rounded-xl text-base font-semibold transition duration-200 ${
                  isActive
                    ? 'bg-cyan-500/15 text-cyan-300 border border-cyan-500/30'
                    : 'text-slate-300 hover:text-white hover:bg-slate-800/60'
                } ${item.highlight ? 'text-cyan-400 font-bold' : ''}`}
              >
                {item.name}
              </a>
            );
          })}
        </div>

      </div>
    </header>

    <!-- 頁面主體 -->
    <main class="flex-grow">
      <slot />
    </main>

    <!-- 頁尾 -->
    <footer class="bg-slate-950 border-t border-slate-900/80 mt-20 py-12 text-slate-400 text-sm">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6 text-center md:text-left md:flex md:justify-between md:items-center">
        <div class="space-y-2">
          <h3 class="text-white font-bold text-lg flex items-center justify-center md:justify-start gap-2">
            <span>🤿</span> 與我們聯繫
          </h3>
          <p>📍 新北市瑞芳區洞頂路136-6號 22451</p>
          <p>📞 +886-921-167-406</p>
          <p>✉️ <a href="mailto:fun4divingofficial@gmail.com" class="hover:text-cyan-400 underline transition">fun4divingofficial@gmail.com</a></p>
        </div>
        <div class="text-xs text-slate-500 pt-4 md:pt-0 border-t border-slate-900 md:border-none">
          © {new Date().getFullYear()} Fun肆潛水 Fun 4 Diving Official. All rights reserved.
        </div>
      </div>
    </footer>

    <script>
      const btn = document.getElementById('mobile-menu-btn');
      const menu = document.getElementById('mobile-menu');
      const openIcon = document.getElementById('menu-icon-open');
      const closeIcon = document.getElementById('menu-icon-close');

      if (btn && menu) {
        btn.addEventListener('click', () => {
          menu.classList.toggle('hidden');
          openIcon?.classList.toggle('hidden');
          closeIcon?.classList.toggle('hidden');
        });
      }
    </script>
  </body>
</html>
FILE_EOF

# 推送至 GitHub
echo "🚀 正在將更新後的 Layout 推送至 GitHub..."
git add src/layouts/Layout.astro
git commit -m "Remove navbar rounded floating border, make full-width stick to top" || true
git push origin main --force

echo "✨ 成功修復！導覽列已改為貼滿螢幕的乾淨樣式！"
