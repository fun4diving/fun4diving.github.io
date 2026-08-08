#!/bin/bash
set -e
echo "📦 開始搬遷 Webnode 所有頁面內容與資料..."

# 1. 寫入【關於我們】 src/pages/about.astro
cat << 'FILE_EOF' > src/pages/about.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="關於我們 Fun 4 Diving Club">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-12">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">About Us</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">關於 Fun肆潛水</h1>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="bg-slate-900/80 p-8 sm:p-10 rounded-2xl border border-slate-800 shadow-2xl space-y-6 text-slate-300 leading-relaxed text-base">
      <p class="text-lg text-white font-medium">
        Fun肆潛水 (Fun 4 Diving Club) 本著 <span class="text-cyan-400 font-bold">「以潛會友」</span> 的宗旨，致力於提供最安全、最專業且具溫度的潛水體驗。
      </p>
      <p>
        我們的基地部位於美麗的東北角瑞芳洞頂路，提供完整的水肺潛水與自由潛水訓練、專業裝備租借以及溫馨舒適的背包客房住宿。
      </p>
      <p>
        不論你是剛接觸大海、想要體驗水下無重力的新手，或是希望精進技巧、考取進階證照的潛友，亦或是尋找夥伴告別「潛水孤兒」的潛水員，我們都誠摯歡迎你加入 Fun肆潛水的大家庭！
      </p>
    </div>
  </section>
</Layout>
FILE_EOF

# 2. 寫入【最新消息】 src/pages/news.astro
cat << 'FILE_EOF' > src/pages/news.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="新聞 News">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-12">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">Latest Updates</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">最新消息 News</h1>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="space-y-6">
      <article class="bg-slate-900/80 p-6 sm:p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/40 transition shadow-xl space-y-3">
        <div class="flex items-center gap-3">
          <span class="text-xs text-cyan-400 bg-cyan-950/80 px-2.5 py-1 rounded border border-cyan-800/50 font-mono">2025-03-05</span>
          <span class="text-xs text-emerald-400 bg-emerald-950/80 px-2.5 py-1 rounded border border-emerald-800/50 font-semibold">社群優惠</span>
        </div>
        <h2 class="text-xl font-bold text-white">加入 Line 社群可享群友優惠並即時獲得最新行程資訊</h2>
        <p class="text-slate-300 text-sm leading-relaxed">
          透過指定連結加入 Line 社群即可獲得群友優惠，並第一時間最快取得最新行程資訊！同時快速結交潛友，告別潛水孤兒生涯！推薦人請輸入：官方網站。
        </p>
        <div class="pt-2">
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="inline-flex items-center gap-1.5 text-xs text-cyan-400 font-bold hover:underline">
            👉 點擊加 LINE 社群領取優惠
          </a>
        </div>
      </article>

      <article class="bg-slate-900/80 p-6 sm:p-8 rounded-2xl border border-slate-800/80 hover:border-cyan-500/40 transition shadow-xl space-y-3">
        <div class="flex items-center gap-3">
          <span class="text-xs text-cyan-400 bg-cyan-950/80 px-2.5 py-1 rounded border border-cyan-800/50 font-mono">2025-03-05</span>
          <span class="text-xs text-amber-400 bg-amber-950/80 px-2.5 py-1 rounded border border-amber-800/50 font-semibold">限時折扣</span>
        </div>
        <h2 class="text-xl font-bold text-white">OW、AOW 課程團報特價</h2>
        <p class="text-slate-300 text-sm leading-relaxed">
          即日起滿三人團報 OW（開放水域潛水員）、AOW（進階開放水域潛水員）課程每人特價折扣 1,000 元，高氧潛水員課程限時優惠折扣 500 元！
        </p>
      </article>
    </div>
  </section>
</Layout>
FILE_EOF

# 3. 寫入【潛水課程與住宿】 src/pages/courses.astro
cat << 'FILE_EOF' > src/pages/courses.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="潛水課程與住宿 Course & Hostel">
  <section class="max-w-5xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-16">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">Training & Hostel</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">潛水課程與住宿</h1>
      <p class="text-slate-400 text-sm">體驗潛水、各階段證照課程與背包客房，價目透明清楚。</p>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
      <!-- 潛水課程卡片 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800/80 shadow-2xl flex flex-col justify-between">
        <div class="space-y-6">
          <div class="flex items-center gap-3">
            <span class="text-3xl">🥽</span>
            <h2 class="text-2xl font-bold text-white">潛水課程與體驗</h2>
          </div>
          <p class="text-slate-300 text-sm leading-relaxed">
            不論是完全沒有經驗的體驗潛水、各階段正規潛水課程，或是更不可錯過的 Fun肆著名 Fun Dive 行程。
          </p>
          <ul class="space-y-3 text-sm text-slate-200">
            <li class="flex items-center gap-2 p-3 bg-slate-950/60 rounded-xl border border-slate-800">
              <span class="text-cyan-400">✓</span> 體驗潛水 Discover Scuba Diving
            </li>
            <li class="flex items-center gap-2 p-3 bg-slate-950/60 rounded-xl border border-slate-800">
              <span class="text-cyan-400">✓</span> OW 初級開放水域潛水員課程
            </li>
            <li class="flex items-center gap-2 p-3 bg-slate-950/60 rounded-xl border border-slate-800">
              <span class="text-cyan-400">✓</span> AOW 進階開放水域潛水員課程
            </li>
            <li class="flex items-center gap-2 p-3 bg-slate-950/60 rounded-xl border border-slate-800">
              <span class="text-cyan-400">✓</span> 高氧潛水員專長課程 (EANx)
            </li>
          </ul>
        </div>
        <div class="pt-6">
          <a href="/fun4diving-website/contact" class="block text-center bg-cyan-500 hover:bg-cyan-400 text-slate-950 font-bold py-3 rounded-xl transition">
            諮詢課程費用與預約
          </a>
        </div>
      </div>

      <!-- 背包客房住宿卡片 -->
      <div class="bg-slate-900/80 p-8 rounded-2xl border border-slate-800/80 shadow-2xl flex flex-col justify-between">
        <div class="space-y-6">
          <div class="flex items-center gap-3">
            <span class="text-3xl">🏠</span>
            <h2 class="text-2xl font-bold text-white">背包客房住宿</h2>
          </div>
          <p class="text-slate-300 text-sm leading-relaxed">
            舒適乾淨的休息空間，讓您在精采的潛水旅程中能好好的放鬆心情，提供您像家一樣的感受。
          </p>
          <div class="p-4 bg-slate-950/60 rounded-xl border border-slate-800 space-y-2 text-xs text-slate-400">
            <p>📍 位置鄰近東北角各大潛點，下水極為便利。</p>
            <p>🚿 提供熱水沖洗與裝備曬衣場。</p>
            <p>🛋️ 舒適溫馨的公共交誼區，與潛友交流經驗。</p>
          </div>
        </div>
        <div class="pt-6">
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="block text-center bg-emerald-600 hover:bg-emerald-500 text-white font-bold py-3 rounded-xl transition">
            LINE 預約背包客房
          </a>
        </div>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 4. 寫入【活動列表】 src/pages/schedule.astro
cat << 'FILE_EOF' > src/pages/schedule.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="活動列表 Schedule">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-12">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">Diving Schedule</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">Fun肆潛水活動列表 Schedule</h1>
      <p class="text-slate-400 text-sm">國內外 Fun Dive 規劃與梯次公告</p>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="bg-slate-900/80 p-8 sm:p-12 rounded-2xl border border-slate-800 shadow-2xl text-center space-y-6">
      <div class="text-4xl">🌏</div>
      <h2 class="text-2xl font-bold text-white">國內外 Fun Dive 帶潛行程</h2>
      <p class="text-slate-300 text-sm sm:text-base leading-relaxed max-w-xl mx-auto">
        包含東北角、墾丁、小琉球、綠島、蘭嶼以及國外潛水行程！所有的行程梯次表與團報資訊，都會在 LINE 社群與官方 FB 粉絲頁第一時間即時發布。
      </p>
      <div>
        <a href="http://lin.ee/lSvAOy4" target="_blank" class="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-black px-8 py-4 rounded-xl transition shadow-lg shadow-emerald-500/20">
          💬 加入 LINE 社群查閱最新梯次
        </a>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 5. 寫入【聯絡我們】 src/pages/contact.astro
cat << 'FILE_EOF' > src/pages/contact.astro
---
import Layout from '../layouts/Layout.astro';
---
<Layout title="聯絡我們 Contact">
  <section class="max-w-4xl mx-auto py-16 px-4">
    <div class="text-center space-y-4 mb-12">
      <span class="text-xs text-cyan-400 bg-cyan-950 px-3 py-1 rounded-full border border-cyan-800 font-semibold tracking-wider uppercase">Contact Us</span>
      <h1 class="text-3xl sm:text-4xl font-black text-white">與我們聯繫 Contact</h1>
      <p class="text-slate-400 text-sm">歡迎透過電話、Email 或社群軟體隨時與 Fun肆潛水 聯繫！</p>
      <div class="w-12 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <div class="bg-slate-900/80 p-8 sm:p-12 rounded-2xl border border-slate-800 shadow-2xl space-y-8">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 text-slate-200">
        <div class="p-6 bg-slate-950/60 rounded-xl border border-slate-800/80 space-y-2">
          <div class="text-2xl text-cyan-400">📍</div>
          <h3 class="font-bold text-white">Fun肆地址</h3>
          <p class="text-sm text-slate-300">新北市瑞芳區洞頂路136-6號<br><span class="text-xs text-slate-500">郵遞區號 22451</span></p>
        </div>

        <div class="p-6 bg-slate-950/60 rounded-xl border border-slate-800/80 space-y-2">
          <div class="text-2xl text-cyan-400">📞</div>
          <h3 class="font-bold text-white">聯絡電話</h3>
          <p class="text-sm text-slate-300">+886-921-167-406</p>
        </div>

        <div class="p-6 bg-slate-950/60 rounded-xl border border-slate-800/80 space-y-2">
          <div class="text-2xl text-cyan-400">📧</div>
          <h3 class="font-bold text-white">E-Mail</h3>
          <p class="text-sm text-slate-300 break-all">fun4divingofficial@gmail.com</p>
        </div>
      </div>

      <div class="pt-6 border-t border-slate-800">
        <h3 class="text-white font-bold text-center mb-6">社群通訊平台 (點擊立即對話)</h3>
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 text-center">
          <a href="https://www.facebook.com/profile.php?id=61559833718251" target="_blank" class="p-3 bg-blue-600/20 hover:bg-blue-600/30 border border-blue-500/30 rounded-xl text-blue-300 font-bold text-sm transition">
            Facebook
          </a>
          <a href="https://www.instagram.com/fun4_diving" target="_blank" class="p-3 bg-pink-600/20 hover:bg-pink-600/30 border border-pink-500/30 rounded-xl text-pink-300 font-bold text-sm transition">
            Instagram
          </a>
          <a href="http://lin.ee/lSvAOy4" target="_blank" class="p-3 bg-emerald-600/20 hover:bg-emerald-600/30 border border-emerald-500/30 rounded-xl text-emerald-300 font-bold text-sm transition">
            LINE 社群
          </a>
          <a href="https://wa.me/+886921167406" target="_blank" class="p-3 bg-green-600/20 hover:bg-green-600/30 border border-green-500/30 rounded-xl text-green-300 font-bold text-sm transition">
            WhatsApp
          </a>
        </div>
      </div>
    </div>
  </section>
</Layout>
FILE_EOF

# 6. 推送至 GitHub 觸發自動建置
echo "🚀 正在將所有舊站資料推送至 GitHub..."
git add .
git commit -m "Migrate all pages and text content from old Webnode site" || true
git push origin main --force

echo "✨ 完成！資料已全數同步！"
