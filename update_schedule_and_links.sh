#!/bin/bash
set -e
echo "📝 正在更新首頁 (index.astro) 連結與活動列表 (schedule.astro) 年度經典活動類別..."

# 1. 更新 src/pages/index.astro (將 Fun Dive 行程連結改為 /schedule)
cat << 'FILE_EOF' > src/pages/index.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="首頁 Index :: Fun肆潛水-Fun 4 Diving Official">
  
  <!-- 1. 融合版 Hero & About 區塊 -->
  <section class="relative min-h-[620px] lg:min-h-[700px] flex items-center justify-center overflow-hidden py-16 px-4 sm:px-6">
    <div class="absolute inset-0 z-0">
      <img 
        src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000008-7b6a07b6a2/S__106807390.jpeg" 
        alt="Fun肆潛水 合照" 
        class="w-full h-full object-cover object-center filter brightness-50 scale-105"
      />
      <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/40 to-slate-950/60"></div>
    </div>

    <div class="relative z-10 max-w-5xl mx-auto text-center space-y-8">
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-cyan-500/20 border border-cyan-400/30 text-cyan-300 font-semibold text-xs sm:text-sm tracking-wider backdrop-blur-md">
        ABOUT FUN 4 DIVING
      </div>

      <h1 class="text-4xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight drop-shadow-lg leading-tight">
        關於 Fun肆潛水
      </h1>

      <p class="text-slate-200 leading-relaxed text-base sm:text-xl max-w-3xl mx-auto font-light drop-shadow">
        我們是一群熱愛海洋、致力於推廣安全與趣味潛水的專業團隊。無論你是初接觸體驗潛水的新手，還是追求更高技術的熱血潛友，Fun肆潛水都能提供最嚴格把關的教學、貼心的行程規劃與安心的水下體驗。
      </p>

      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 max-w-3xl mx-auto pt-2">
        <div class="bg-slate-900/80 backdrop-blur-md p-4 rounded-2xl border border-slate-700/60 text-center space-y-1 shadow-lg">
          <div class="text-cyan-400 font-bold text-base">🤿 專業教學</div>
          <div class="text-slate-300 text-xs">嚴格把關安全品質</div>
        </div>
        <div class="bg-slate-900/80 backdrop-blur-md p-4 rounded-2xl border border-slate-700/60 text-center space-y-1 shadow-lg">
          <div class="text-cyan-400 font-bold text-base">🌊 豐富潛旅</div>
          <div class="text-slate-300 text-xs">國內外精選景點</div>
        </div>
        <div class="bg-slate-900/80 backdrop-blur-md p-4 rounded-2xl border border-slate-700/60 text-center space-y-1 shadow-lg">
          <div class="text-cyan-400 font-bold text-base">🏠 溫馨基地</div>
          <div class="text-slate-300 text-xs">東北角背包客房</div>
        </div>
      </div>

      <div class="pt-4">
        <a 
          href="/about" 
          class="inline-flex items-center gap-2 px-9 py-4 rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-base sm:text-lg hover:scale-105 transition duration-300 shadow-2xl shadow-cyan-500/30"
        >
          了解更多我們的故事 →
        </a>
      </div>
    </div>
  </section>

  <div class="py-16 px-4 sm:px-6 max-w-7xl mx-auto space-y-20">

    <!-- 2. Fun Dive 報名資訊 -->
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

    <!-- 3. 我們的服務 -->
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

    <!-- 4. 課程及行程詳細內容 (Fun Dive行程已連至 /schedule) -->
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

    <!-- 5. 最新消息 -->
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

# 2. 更新 src/pages/schedule.astro (新增『Fun肆潛水 年度經典活動』專區)
cat << 'FILE_EOF' > src/pages/schedule.astro
---
import Layout from '../layouts/Layout.astro';

const classicEvents = [
  {
    title: "2026年度感恩宴會",
    organizer: "",
    date: "",
    link: "",
    status: "ended"
  },
  {
    title: "2026 年度 Fun肆 淨灘靜海活動",
    organizer: "",
    date: "",
    link: "",
    status: "ended"
  },
  {
    title: "2026 年度 Fun肆 大會烤",
    organizer: "阿豪 (協辦：劉大, 胖胖, 老王, 吉米)",
    date: "2026/08/15",
    link: "https://forms.gle/ydiHKFiDNGCHbbDD7",
    status: "open"
  }
];

const domesticTrips = [
  {
    location: "七星岩",
    organizer: "歡迎揪團",
    date: "歡迎洽詢",
    link: "",
    status: "welcome"
  },
  {
    location: "澎湖南方四島 (船宿)",
    organizer: "劉大",
    date: "9/1 (二) ~ 9/3 (四)",
    link: "https://forms.gle/rCmMfQYpDYJGaoGg9",
    status: "open"
  },
  {
    location: "小琉球",
    organizer: "阿豪",
    date: "8/18 (二) ~ 8/21 (五)",
    link: "https://forms.gle/fBRQwMBFe8ZvKP257",
    status: "open"
  },
  {
    location: "蘭嶼",
    organizer: "老王",
    date: "8/22 (六) ~ 8/25 (二)",
    link: "https://forms.gle/CaCp4NkdotzzDTWb9",
    status: "waitlist"
  },
  {
    location: "綠島",
    organizer: "老王",
    date: "2026/9/25 (五) ~ 9/28 (一)",
    link: "https://forms.gle/KQ4uvR1bCcsUTy5y6",
    status: "open"
  }
];

const overseasTrips = [
  {
    countryName: "菲律賓",
    flagCode: "ph",
    events: [
      {
        title: "2026國慶媽媽島 遇見長尾鯊",
        organizer: "阿豪, 吉米",
        date: "2026/10/8 - 10/12",
        link: "https://forms.gle/Kh9auYBwcTmXak8i7"
      },
      {
        title: "2027 228 科隆 (Coron)",
        organizer: "老王",
        date: "2027/2/27 (六) - 2027/3/3 (三)",
        link: ""
      },
      {
        title: "2027 51勞動節連假 薄荷島 (Bohol)",
        organizer: "老王",
        date: "2027/4/30 (五) - 2027/5/4 (二)",
        link: ""
      }
    ]
  },
  {
    countryName: "馬來西亞",
    flagCode: "my",
    events: [
      {
        title: "西巴丹",
        organizer: "阿豪, 吉米",
        date: "2026/5/7 - 5/12",
        link: "https://forms.gle/vJzNHB6JpueG5JuG8"
      },
      {
        title: "西巴丹 (中秋假期)",
        organizer: "阿豪, 吉米",
        date: "2026/9/25 - 9/29",
        link: "https://forms.gle/sj68xZTTEX9dt5KS6"
      }
    ]
  },
  {
    countryName: "帛琉",
    flagCode: "pw",
    events: [
      {
        title: "帛琉潛旅",
        organizer: "老王",
        date: "2026/10/21 (三) - 10/26 (一)",
        link: "https://forms.gle/xe2g2QJ8Jz8VaDrT6"
      }
    ]
  },
  {
    countryName: "泰國",
    flagCode: "th",
    events: [
      {
        title: "斯米蘭",
        organizer: "阿豪, 吉米",
        date: "2027/2/27 - 2027/3/4",
        link: "https://forms.gle/92k6M7FaCs6d79Rh6"
      },
      {
        title: "斯米蘭",
        organizer: "老王",
        date: "2027/3/31 (三) - 4/5 (一)",
        link: "https://forms.gle/Lor2qp4r7LUmzVor5"
      }
    ]
  },
  {
    countryName: "馬爾地夫",
    flagCode: "mv",
    events: [
      {
        title: "經典四方線 (農曆春節)",
        organizer: "阿豪, 吉米",
        date: "2027/2/4 - 2/10",
        link: ""
      }
    ]
  },
  {
    countryName: "印尼",
    flagCode: "id",
    events: [
      {
        title: "科摩多",
        organizer: "阿豪, 吉米",
        date: "2027/4/3 - 4/6",
        link: ""
      },
      {
        title: "馬拉圖",
        organizer: "阿豪, 吉米",
        date: "2027中秋節",
        link: ""
      }
    ]
  },
  {
    countryName: "埃及",
    flagCode: "eg",
    events: [
      {
        title: "紅海 (BDE)",
        organizer: "老王",
        date: "2027國慶連假",
        link: ""
      }
    ]
  }
];
---

<Layout title="潛水活動列表 :: Fun肆潛水-Fun 4 Diving Official">
  <div class="py-16 px-4 sm:px-6 max-w-6xl mx-auto space-y-16">
    
    <!-- 頁面頂部標題區 -->
    <div class="text-center space-y-4">
      <h1 class="text-4xl sm:text-5xl font-black text-white tracking-tight">潛水活動列表</h1>
      <p class="text-cyan-400 font-medium tracking-wide">Schedule & Events</p>
      <div class="w-20 h-1 bg-gradient-to-r from-cyan-400 to-blue-600 mx-auto rounded-full"></div>
    </div>

    <!-- 0. Fun肆潛水 年度經典活動 區塊 -->
    <section class="space-y-8">
      <div class="flex items-center gap-3 border-l-4 border-amber-400 pl-4">
        <h2 class="text-2xl sm:text-3xl font-bold text-white flex items-center gap-3">
          <span>🏆 Fun肆潛水 年度經典活動</span>
        </h2>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {classicEvents.map((item) => (
          <div class="bg-slate-900/90 rounded-2xl border border-slate-800 p-6 flex flex-col justify-between shadow-xl hover:border-amber-500/40 transition duration-300">
            <div class="space-y-3">
              <div class="flex items-start justify-between gap-2">
                <h3 class="text-xl font-bold text-white leading-snug">
                  {item.title}
                </h3>
                {item.status === "ended" && (
                  <span class="px-2.5 py-0.5 rounded text-xs font-semibold bg-slate-800 text-slate-400 border border-slate-700 shrink-0">已結束</span>
                )}
                {item.status === "open" && (
                  <span class="px-2.5 py-0.5 rounded text-xs font-semibold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 shrink-0">🔥 熱烈報名中</span>
                )}
              </div>
              
              {item.organizer && (
                <div class="text-sm text-slate-300 space-y-1 pt-1">
                  <div><span class="text-slate-400">主辦：</span>{item.organizer}</div>
                  {item.date && <div><span class="text-slate-400">日期：</span><span class="font-mono text-cyan-300">{item.date}</span></div>}
                </div>
              )}
            </div>

            <div class="pt-6">
              {item.link ? (
                <a 
                  href={item.link} 
                  target="_blank" 
                  rel="nofollow noreferrer"
                  class="block w-full py-2.5 text-center rounded-xl bg-gradient-to-r from-amber-500 to-orange-600 text-white font-bold text-sm hover:scale-105 transition duration-300 shadow-lg shadow-amber-500/20"
                >
                  填寫報名表單 ↗
                </a>
              ) : (
                <div class="w-full py-2.5 text-center rounded-xl bg-slate-800/60 text-slate-500 font-medium text-sm">
                  活動已圓滿結束
                </div>
              )}
            </div>
          </div>
        ))}
      </div>
    </section>

    <!-- 1. 國內潛旅區塊 -->
    <section class="space-y-8">
      <div class="flex items-center gap-3 border-l-4 border-cyan-400 pl-4">
        <h2 class="text-2xl sm:text-3xl font-bold text-white flex items-center gap-3">
          <img 
            src="https://flagcdn.com/tw.svg" 
            alt="台灣國旗" 
            class="w-8 h-auto rounded shadow-sm border border-slate-700/50 inline-block"
          />
          <span>國內潛旅</span>
        </h2>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {domesticTrips.map((trip) => (
          <div class="bg-slate-900 rounded-2xl border border-slate-800 p-6 flex flex-col justify-between shadow-xl hover:border-cyan-500/40 transition duration-300">
            <div class="space-y-3">
              <div class="flex items-center justify-between">
                <h3 class="text-xl font-bold text-white">
                  {trip.location}
                </h3>
                {trip.status === "waitlist" && (
                  <span class="px-2.5 py-0.5 rounded text-xs font-semibold bg-amber-500/10 text-amber-400 border border-amber-500/20">填表候補</span>
                )}
                {trip.status === "welcome" && (
                  <span class="px-2.5 py-0.5 rounded text-xs font-semibold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">✅ 歡迎揪團</span>
                )}
              </div>
              
              <div class="text-sm text-slate-300 space-y-1">
                <div><span class="text-slate-400">主辦：</span>{trip.organizer}</div>
                <div><span class="text-slate-400">日期：</span><span class="font-mono text-cyan-300">{trip.date}</span></div>
              </div>
            </div>

            <div class="pt-6">
              {trip.link ? (
                <a 
                  href={trip.link} 
                  target="_blank" 
                  rel="nofollow noreferrer"
                  class="block w-full py-2.5 text-center rounded-xl bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-sm hover:scale-105 transition duration-300 shadow-lg shadow-cyan-500/20"
                >
                  填寫報名資訊 ↗
                </a>
              ) : (
                <div class="w-full py-2.5 text-center rounded-xl bg-slate-800 text-slate-400 font-medium text-sm">
                  {trip.status === "welcome" ? "歡迎直接聯繫詢問" : "活動籌備中"}
                </div>
              )}
            </div>
          </div>
        ))}
      </div>
    </section>

    <!-- 2. 國外潛旅區塊 -->
    <section class="space-y-8">
      <div class="flex items-center gap-3 border-l-4 border-cyan-400 pl-4">
        <h2 class="text-2xl sm:text-3xl font-bold text-white">🔥 國外潛旅</h2>
      </div>

      <div class="space-y-8">
        {overseasTrips.map((group) => (
          <div class="bg-slate-900/80 rounded-2xl border border-slate-800 p-6 sm:p-8 space-y-6 shadow-xl">
            <h3 class="text-2xl font-bold text-cyan-300 pb-2 border-b border-slate-800 flex items-center gap-3">
              <img 
                src={`https://flagcdn.com/${group.flagCode}.svg`} 
                alt={`${group.countryName}國旗`} 
                class="w-8 h-auto rounded shadow-sm border border-slate-700/50 inline-block"
              />
              <span>{group.countryName}</span>
            </h3>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {group.events.map((event) => (
                <div class="bg-slate-950/60 rounded-xl border border-slate-800 p-5 flex flex-col justify-between space-y-4 hover:border-cyan-500/30 transition">
                  <div class="space-y-2">
                    <h4 class="font-bold text-white text-lg leading-snug">
                      {event.title}
                    </h4>
                    <div class="text-xs sm:text-sm text-slate-300 space-y-1">
                      <div><span class="text-slate-400">主辦：</span>{event.organizer}</div>
                      <div><span class="text-slate-400">日期：</span><span class="font-mono text-cyan-300">{event.date}</span></div>
                    </div>
                  </div>

                  <div>
                    {event.link ? (
                      <a 
                        href={event.link} 
                        target="_blank" 
                        rel="nofollow noreferrer"
                        class="block w-full py-2 text-center rounded-lg bg-cyan-600 hover:bg-cyan-500 text-white font-bold text-xs sm:text-sm transition duration-300"
                      >
                        活動報名表 ↗
                      </a>
                    ) : (
                      <span class="block w-full py-2 text-center rounded-lg bg-slate-800/80 text-amber-400/90 font-medium text-xs sm:text-sm border border-amber-500/20">
                        ⏳ 籌備中
                      </span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>

  </div>
</Layout>
FILE_EOF

# 本地打包測試
npm run build

# Git 提交並自動推送發布
git add . && git commit -m "Update Fun Dive link to Schedule page and add Classic Events section" && git push origin main

echo "✨ 更新完成！Fun Dive 按鈕連結已轉至 /schedule，且 Schedule 頁面已新增『年度經典活動』類別！"
