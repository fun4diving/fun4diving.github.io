#!/bin/bash
set -e

echo "⚙️ 1. 更新頁面 (src/pages/survey.astro) 加入完整 Google 表單選項與保險說明..."

cat << 'ASTRO_EOF' > src/pages/survey.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="東北角 Fun Dive 報名與切結書 - FUN 肆潛水">
  <main class="max-w-4xl mx-auto px-4 py-8 text-gray-800">
    <div class="bg-white p-6 sm:p-10 rounded-xl shadow-lg border border-gray-100 space-y-8">
      
      <!-- 頁面大標題 -->
      <div class="text-center border-b border-gray-200 pb-6">
        <h1 class="text-2xl sm:text-3xl font-bold text-blue-900 mb-2">FUN 肆潛水 - 東北角 Fun Dive 報名表單</h1>
        <p class="text-sm text-gray-600">請完整填寫以下報名資料與健康聲明切結書</p>
      </div>

      <form id="full-survey-form" class="space-y-8">

        <!-- ================= 前半段：Google 表單報名內容 ================= -->
        <div class="space-y-6">
          <h2 class="text-xl font-bold text-blue-800 border-l-4 border-blue-600 pl-3">📋 活動報名資料</h2>

          <!-- 1. 報名日期/梯次 -->
          <div>
            <label class="block text-sm font-bold mb-1">報名活動日期 / 梯次 <span class="text-red-500">*</span></label>
            <input type="date" name="event_date" required class="w-full sm:w-1/2 border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" />
          </div>

          <!-- 2. 參加項目 -->
          <div>
            <label class="block text-sm font-bold mb-2">參加項目 <span class="text-red-500">*</span></label>
            <div class="space-y-2 text-sm">
              <label class="flex items-center space-x-2"><input type="radio" name="event_type" value="岸潛 Fun Dive" required class="text-blue-600 focus:ring-blue-500" /> <span>岸潛 Fun Dive</span></label>
              <label class="flex items-center space-x-2"><input type="radio" name="event_type" value="船潛 Fun Dive" class="text-blue-600 focus:ring-blue-500" /> <span>船潛 Fun Dive</span></label>
              <label class="flex items-center space-x-2"><input type="radio" name="event_type" value="夜潛 Fun Dive" class="text-blue-600 focus:ring-blue-500" /> <span>夜潛 Fun Dive</span></label>
              <label class="flex items-center space-x-2"><input type="radio" name="event_type" value="體驗潛水" class="text-blue-600 focus:ring-blue-500" /> <span>體驗潛水 (無證照可)</span></label>
            </div>
          </div>

          <!-- 3. 潛水系統與級別 -->
          <div>
            <label class="block text-sm font-bold mb-1">潛水系統與系統級別 <span class="text-red-500">*</span></label>
            <input type="text" name="certification_detail" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：PADI AOW / SSI OW / CMAS 二星" />
          </div>

          <!-- 4. 氣瓶支數 -->
          <div>
            <label class="block text-sm font-bold mb-1">總氣瓶支數 (Approx. Logged Dives) <span class="text-red-500">*</span></label>
            <input type="number" name="logged_dives" required class="w-full sm:w-1/2 border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：35" />
          </div>

          <!-- 5. 上次潛水時間 -->
          <div>
            <label class="block text-sm font-bold mb-1">上次潛水時間 <span class="text-red-500">*</span></label>
            <select name="last_dive_time" required class="w-full sm:w-1/2 border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none">
              <option value="">請選擇上次潛水距今時間</option>
              <option value="1個月內">1 個月內</option>
              <option value="1-3個月內">1 - 3 個月內</option>
              <option value="3-6個月內">3 - 6 個月內</option>
              <option value="半年至1年內">半年至 1 年內</option>
              <option value="超過1年 (建議複習)">超過 1 年 (建議進行 Check Dive / 複習)</option>
            </select>
          </div>

          <!-- 6. 裝備租借需求 -->
          <div>
            <label class="block text-sm font-bold mb-2">輕重裝備租借需求 (可複選)</label>
            <div class="grid grid-cols-2 sm:grid-cols-3 gap-3 text-sm">
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="全套輕重裝" class="rounded text-blue-600" /> <span>全套輕重裝</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="BCD" class="rounded text-blue-600" /> <span>BCD 浮力調整背心</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="調節器" class="rounded text-blue-600" /> <span>調節器組</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="防寒衣" class="rounded text-blue-600" /> <span>防寒衣</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="面鏡呼吸管" class="rounded text-blue-600" /> <span>面鏡 / 呼吸管</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="蛙鞋" class="rounded text-blue-600" /> <span>蛙鞋 / 套鞋</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="電腦錶" class="rounded text-blue-600" /> <span>潛水電腦錶</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear_rental" value="水下手電筒" class="rounded text-blue-600" /> <span>水下手電筒</span></label>
            </div>
          </div>

          <!-- 7. 身高、體重、鞋號 (租借裝備尺寸) -->
          <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 bg-gray-50 p-4 rounded-lg border border-gray-200">
            <div>
              <label class="block text-xs font-bold text-gray-700 mb-1">身高 (cm)</label>
              <input type="number" name="height" class="w-full border border-gray-300 rounded p-2 text-sm focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：175" />
            </div>
            <div>
              <label class="block text-xs font-bold text-gray-700 mb-1">體重 (kg)</label>
              <input type="number" name="weight" class="w-full border border-gray-300 rounded p-2 text-sm focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：68" />
            </div>
            <div>
              <label class="block text-xs font-bold text-gray-700 mb-1">腳長/鞋號 (cm)</label>
              <input type="text" name="shoe_size" class="w-full border border-gray-300 rounded p-2 text-sm focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：26.5" />
            </div>
          </div>

          <!-- 8. 飲食習慣 / 備註需求 -->
          <div>
            <label class="block text-sm font-bold mb-1">飲食習慣或特別需求</label>
            <input type="text" name="dietary_needs" class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="葷食 / 素食 / 過敏原備註" />
          </div>
        </div>

        <!-- ================= 中間：原本完全不動的切結書區域 ================= -->
        <div class="pt-6 border-t-2 border-gray-200 space-y-6">
          <h2 class="text-xl font-bold text-blue-900 border-l-4 border-blue-600 pl-3">📜 水域遊憩活動特別風險聲明與責任限制切結書</h2>

          <!-- 一、 切結書全文（可滾動閱覽框） -->
          <div class="space-y-3 border-b border-gray-200 pb-6">
            <p class="text-sm text-gray-700 leading-relaxed">親愛的活動參與者您好：<br>為了確保您的合法權益及生命財產安全，在您報名參與本潛店（以下簡稱「本公司」）所組織、安排或指導之水域遊憩活動（包括但不限於水肺潛水、船潛、自由潛水、浮潛等）前，請務必詳細閱讀、充分理解並同意本切結書之各項條款。當您勾選同意或簽名時，即視為您已完全理解並願意承擔活動相關風險。</p>

            <div class="bg-gray-50 p-4 rounded-lg border border-gray-300 h-64 overflow-y-scroll text-xs text-gray-700 leading-relaxed space-y-4 mt-4">
              <div>
                <h3 class="font-bold text-gray-900 mb-1">一、 水域活動特別已知風險聲明</h3>
                <p>1. 本人充分知悉並理解，水域遊憩活動（特別是深海潛水、船潛活動）具有不可預測之環境風險，包括但不限於：突發性極端海流（如上升流、下層流、洗衣機流）、海象驟變、能見度惡化、水下生物攻擊及船艇機械操作環境等。</p>
                <p>2. 本人明白上述環境突變可能導致個人在水下發生非自願性快速上升、無法維持中性浮力或無法完成安全停留等緊急狀況，進而引發減壓症（減壓病/潛水夫病）、急性空氣栓塞、肺部氣壓傷、溺水、失能或死亡等嚴重身體傷害。</p>
              </div>

              <div>
                <h3 class="font-bold text-gray-900 mb-1">二、 個人健康狀況據實告知義務</h3>
                <p>1. 本人確信自身身體狀況良好，並無高血壓、心臟病、癲癇、嚴重氣喘、耳膜穿孔、近期手術或其他不適合從事潛水活動之內外科疾病。</p>
                <p>2. 本人承諾，於活動前一日及當日絕不飲酒、熬夜或服用具嗜嗜睡性之藥物。若活動當日身體有任何不適（如感冒、鼻塞、頭暈、脫水等），本人有義務主動且據實告知帶隊教練，並由教練評估是否適合下水。若因隱瞞健康狀況而導致意外，本人願自行承擔一切後果。</p>
              </div>

              <div>
                <h3 class="font-bold text-gray-900 mb-1">三、 活動安全規範遵守與現場指揮</h3>
                <p>1. 本人同意在活動全程中，嚴格遵守帶隊教練及隨船導潛之安全簡報（Briefing）、水下潛水計畫（Dive Plan）及各項安全指導。</p>
                <p>2. 本人承諾隨時與潛伴（Buddy）保持安全聯絡與隨行，並嚴格監控自身電腦錶（Dive Computer）之殘壓、深度、免減壓時間（NDL）及上升速度警告。</p>
                <p>3. 如在水下遭遇強流、能見度不佳或裝備異常等突發狀況，本人應立即依教練或標準程序進行非自願防衛處置，並在能力範圍內尋求協助，絕不擅自脫隊、暴衝或進行危險潛水行為。</p>
              </div>

              <div>
                <h3 class="font-bold text-gray-900 mb-1">四、 保險保障範圍與責任限制聲明</h3>
                <p>1. 本人知悉本公司已依法投保「水域遊憩活動責任保險」，該保險之理賠依法以「本公司或隨行教練具有法律上之過失賠償責任」為啟動前提。</p>
                <p>2. 本人充分理解，若事故之發生經鑑定純屬不可抗力之天災、環境極端海流（如無法預期之突發上升流），或因個人體質、隱匿疾病、未遵守安全規範、個人操作失誤所致，而在法律上認定本公司與教練已盡善良管理人之注意義務而無過失責任時，該責任保險將可能無法啟動理賠。</p>
                <p class="font-semibold text-blue-900 mt-1">3. 【強烈建議投保特定活動傷害險】基於上述責任險之限制，本公司已強烈建議本人於活動前，應自行加保「特定活動傷害保險（潛水險）」，以確保無論事故原因是否涉及業者過失，個人因減壓症（減壓病）或其他特定突發疾病之醫療費用與高壓氧治療費用，皆能獲得個人保險之無條件完整保障。</p>
              </div>

              <div>
                <h3 class="font-bold text-gray-900 mb-1">五、 法律效力與爭議解決</h3>
                <p>1. 本切結書之各條款具有獨立性，若部分條款經法院判定無效，不影響其他條款之法律效力。</p>
                <p>2. 本人確認是在完全自願、清醒且無任何強迫之情況下，詳細閱讀並勾選/簽署本切結書，且本切結書之效力及於本人的法定繼承人、家屬及財產代理人。</p>
              </div>
            </div>

            <!-- 強制勾選同意 -->
            <div class="pt-2">
              <label class="flex items-start space-x-2 bg-blue-50 p-3 rounded-lg border border-blue-200 cursor-pointer">
                <input type="checkbox" name="agreed_terms" required class="mt-1 rounded text-blue-600 focus:ring-blue-500" />
                <span class="text-xs text-blue-900 font-medium">
                  我已詳細閱讀、完全理解並同意上述『水域遊憩活動特別風險聲明與責任限制切結書』之全部內容，並確認自身無上述不適宜潛水之疾病。<span class="text-red-500">* (必填)</span>
                </span>
              </label>
            </div>
          </div>

          <!-- 二、 立切結書人與資料填寫 -->
          <div class="space-y-4 border-b border-gray-200 pb-6">
            <div class="bg-gray-100 p-4 rounded-lg border border-gray-200">
               <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                
                <!-- 左側：立切結書人 -->
                <div class="space-y-3 border-b md:border-b-0 md:border-r border-gray-300 pb-4 md:pb-0 md:pr-4">
                  <div>
                    <label class="block text-sm font-bold mb-1">立切結書人 (參與者姓名) <span class="text-red-500">*</span></label>
                    <input type="text" name="name" required class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none" />
                  </div>
                  <div>
                    <label class="block text-sm font-bold mb-1">身分證字號 / 護照號碼 <span class="text-red-500">*</span></label>
                    <input type="text" name="id_number" required class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none" />
                  </div>
                </div>

                <!-- 右側：緊急聯絡人與法定代理人 -->
                <div class="space-y-3 md:pl-4">
                   <div>
                    <label class="block text-sm font-bold mb-1 text-red-700">緊急聯絡人 姓名/關係 <span class="text-red-500">*</span></label>
                    <input type="text" name="emergency_name_relation" required class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：王小明 / 父親" />
                  </div>
                  <div>
                    <label class="block text-sm font-bold mb-1 text-red-700">緊急聯絡人 電話 <span class="text-red-500">*</span></label>
                    <input type="tel" name="emergency_phone" required class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none" />
                  </div>
                </div>
              </div>

              <!-- 法定代理人 (跨欄) -->
              <div class="mt-4 pt-4 border-t border-gray-300">
                 <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                   <div>
                      <label class="block text-sm font-bold text-gray-700 mb-1">法定代理人 (未滿18歲須填寫)</label>
                      <input type="text" name="guardian_name" class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none bg-white" placeholder="法定代理人姓名" />
                   </div>
                   <div>
                      <label class="block text-sm font-bold text-gray-700 mb-1">與參與者關係</label>
                      <input type="text" name="guardian_relation" class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none bg-white" placeholder="例如：父母" />
                   </div>
                 </div>
              </div>
            </div>
          </div>

          <!-- 三、 電子簽名 -->
          <div class="space-y-2">
            <label class="block text-sm font-bold text-gray-800">
              電子簽名區 <span class="text-red-500">* (必填)</span>
            </label>
            <div class="border-2 border-dashed border-gray-300 rounded-lg bg-gray-50 relative">
              <canvas id="signature-pad" class="w-full h-44 rounded-lg cursor-crosshair block"></canvas>
            </div>
            <div class="flex justify-between items-center text-xs">
              <button type="button" id="clear-btn" class="text-red-600 hover:underline">清除重簽</button>
              <span id="sig-error" class="text-red-500 font-bold hidden">⚠️ 請務必完成電子簽名才能提交！</span>
            </div>
          </div>
        </div>

        <!-- ================= 最下面：保險說明警告區塊 ================= -->
        <div class="bg-amber-50 border-2 border-amber-300 p-5 rounded-xl space-y-2 text-sm text-amber-900">
          <h3 class="font-bold text-base flex items-center space-x-1 text-amber-950">
            <span>保險說明 ⚠️</span>
          </h3>
          <ol class="list-decimal list-inside space-y-1 text-xs sm:text-sm leading-relaxed">
            <li>本店均依法為團員投保富邦公共意外責任險及水域遊憩活動責任險。</li>
            <li>於活動期間，若因岸上行走或水下碰撞導致意外受傷，均可協助申請保險理賠。</li>
            <li>惟因個人操作不當導致快速上升所引發之減壓症，保險公司保有審核理賠與否之權利。</li>
            <li>為確保個人權益，團員可依自身需求，額外加保個人專屬潛水險，以獲得更全面的醫療保障。</li>
          </ol>
        </div>

        <input type="hidden" name="signature_data" id="sig-input" />
        <input type="hidden" name="signed_at" id="signed-at-input" />

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-4 rounded-lg shadow-lg text-lg transition duration-200">
          確認提交報名表與完成簽署
        </button>
      </form>
    </div>
  </main>

  <script>
    const canvas = document.getElementById('signature-pad');
    const ctx = canvas.getContext('2d');
    const clearBtn = document.getElementById('clear-btn');
    const form = document.getElementById('full-survey-form');
    const sigInput = document.getElementById('sig-input');
    const signedAtInput = document.getElementById('signed-at-input');
    const sigError = document.getElementById('sig-error');

    let isDrawing = false;
    let hasSigned = false;

    function initCanvas() {
      canvas.width = canvas.parentElement.clientWidth;
      canvas.height = 176;
      ctx.lineWidth = 2.5;
      ctx.strokeStyle = '#0f172a';
      ctx.lineCap = 'round';
    }
    initCanvas();
    window.addEventListener('resize', initCanvas);

    function getPos(e) {
      const rect = canvas.getBoundingClientRect();
      const clientX = e.touches ? e.touches[0].clientX : e.clientX;
      const clientY = e.touches ? e.touches[0].clientY : e.clientY;
      return { x: clientX - rect.left, y: clientY - rect.top };
    }

    function startDraw(e) {
      isDrawing = true;
      hasSigned = true;
      sigError.classList.add('hidden');
      const pos = getPos(e);
      ctx.beginPath();
      ctx.moveTo(pos.x, pos.y);
    }

    function draw(e) {
      if (!isDrawing) return;
      e.preventDefault();
      const pos = getPos(e);
      ctx.lineTo(pos.x, pos.y);
      ctx.stroke();
    }

    function stopDraw() { isDrawing = false; }

    canvas.addEventListener('mousedown', startDraw);
    canvas.addEventListener('mousemove', draw);
    canvas.addEventListener('mouseup', stopDraw);
    canvas.addEventListener('touchstart', startDraw);
    canvas.addEventListener('touchmove', draw);
    canvas.addEventListener('touchend', stopDraw);

    clearBtn.addEventListener('click', () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      hasSigned = false;
      sigInput.value = '';
    });

    form.addEventListener('submit', (e) => {
      if (!hasSigned) {
        e.preventDefault();
        sigError.classList.remove('hidden');
        return;
      }
      sigInput.value = canvas.toDataURL();
      signedAtInput.value = new Date().toISOString();
      alert('報名表與電子簽名已成功送出！');
    });
  </script>
</Layout>
ASTRO_EOF

echo "⚙️ 2. 在 Layout/Navbar 中新增『東北角Fun Dive報名』選單選項..."

# 搜尋 Header / Layout / Navbar 組件並新增連結標籤
if [ -f "src/components/Header.astro" ]; then
  sed -i '/<\/nav>/i \  <a href="/survey" class="hover:text-blue-600 font-medium">東北角Fun Dive報名<\/a>' src/components/Header.astro || true
elif [ -f "src/layouts/Layout.astro" ]; then
  sed -i '/<\/nav>/i \  <a href="/survey" class="hover:text-blue-600 font-medium">東北角Fun Dive報名<\/a>' src/layouts/Layout.astro || true
fi

git add .
git commit -m "Add full registration form, insurance warning block, and add Fun Dive registration to header nav" || true
git push origin main --force

echo "✨ 已成功完成更新並推送到 GitHub！"
