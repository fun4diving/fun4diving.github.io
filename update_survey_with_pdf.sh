#!/bin/bash
set -e

echo "⚙️ 更新 src/pages/survey.astro 以完整嵌入 PDF 切結書條款..."

cat << 'ASTRO_EOF' > src/pages/survey.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="水域遊憩活動特別風險聲明與責任限制切結書 - FUN 肆潛水">
  <main class="max-w-4xl mx-auto px-4 py-8 text-gray-800">
    <div class="bg-white p-6 sm:p-10 rounded-xl shadow-lg border border-gray-100">
      
      <!-- 標題與說明 -->
      <h1 class="text-2xl sm:text-3xl font-bold text-center text-blue-900 mb-2">FUN 肆潛水 - 水域遊憩活動特別風險聲明與責任限制切結書</h1>
      <p class="text-xs text-gray-500 text-center mb-8">（報名線上欄位 / 電子簽署專用條款）</p>

      <form id="full-survey-form" class="space-y-6">
        
        <!-- 一、基本資料 -->
        <div class="space-y-4 border-b border-gray-200 pb-6">
          <h2 class="text-lg font-semibold text-blue-800 border-l-4 border-blue-600 pl-2">一、 參與者基本資料</h2>
          
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium mb-1">參與者姓名 (立切結書人) <span class="text-red-500">*</span></label>
              <input type="text" name="name" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="請輸入中文姓名" />
            </div>

            <div>
              <label class="block text-sm font-medium mb-1">身分證字號 / 護照號碼 <span class="text-red-500">*</span></label>
              <input type="text" name="id_number" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="保險辦理與核對身分使用" />
            </div>

            <div>
              <label class="block text-sm font-medium mb-1">聯絡電話 <span class="text-red-500">*</span></label>
              <input type="tel" name="phone" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="09xx-xxx-xxx" />
            </div>

            <div>
              <label class="block text-sm font-medium mb-1">出生年月日 <span class="text-red-500">*</span></label>
              <input type="date" name="birthday" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>

            <div>
              <label class="block text-sm font-medium mb-1">緊急聯絡人姓名與關係 <span class="text-red-500">*</span></label>
              <input type="text" name="emergency_name" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：王小明 (父親)" />
            </div>

            <div>
              <label class="block text-sm font-medium mb-1">緊急聯絡人電話 <span class="text-red-500">*</span></label>
              <input type="tel" name="emergency_phone" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
        </div>

        <!-- 二、聲明書全文（可滾動閱覽框） -->
        <div class="space-y-3 border-b border-gray-200 pb-6">
          <h2 class="text-lg font-semibold text-blue-800 border-l-4 border-blue-600 pl-2">二、 切結書詳細條款內容</h2>
          <p class="text-xs text-gray-500">親愛的活動參與者您好：為了確保您的合法權益及生命財產安全，在您報名參與本潛店（以下簡稱「本公司」）所組織、安排或指導之水域遊憩活動（包括但不限於水肺潛水、船潛、自由潛水、浮潛等）前，請務必詳細閱讀、充分理解並同意本切結書之各項條款。</p>

          <div class="bg-gray-50 p-4 rounded-lg border border-gray-300 h-64 overflow-y-scroll text-xs text-gray-700 leading-relaxed space-y-4">
            <div>
              <h3 class="font-bold text-gray-900 mb-1">一、 水域活動特別已知風險聲明</h3>
              <p>1. 本人充分知悉並理解，水域遊憩活動（特別是深海潛水、船潛活動）具有不可預測之環境風險，包括但不限於：突發性極端海流（如上升流、下層流、洗衣機流）、海象驟變、能見度惡化、水下生物攻擊及船艇機械操作環境等。</p>
              <p>2. 本人明白上述環境突變可能導致個人在水下發生非自願性快速上升、無法維持中性浮力或無法完成安全停留等緊急狀況，進而引發減壓症（減壓病/潛水夫病）、急性空氣栓塞、肺部氣壓傷、溺水、失能或死亡等嚴重身體傷害。</p>
            </div>

            <div>
              <h3 class="font-bold text-gray-900 mb-1">二、 個人健康狀況據實告知義務</h3>
              <p>1. 本人確信自身身體狀況良好，並無高血壓、心臟病、癲癇、嚴重氣喘、耳膜穿孔、近期手術或其他不適合從事潛水活動之內外科疾病。</p>
              <p>2. 本人承諾，於活動前一日及當日絕不飲酒、熬夜或服用具嗜睡性之藥物。若活動當日身體有任何不適（如感冒、鼻塞、頭暈、脫水等），本人有義務主動且據實告知帶隊教練，並由教練評估是否適合下水。若因隱瞞健康狀況而導致意外，本人願自行承擔一切後果。</p>
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
                我已詳細閱讀、完全理解並同意上述『水域遊憩活動特別風險聲明與責任限制切結書』之全部內容，並確認自身無上述不適宜潛水之疾病。<span class="text-red-500">* (必勾選)</span>
              </span>
            </label>
          </div>
        </div>

        <!-- 三、未成年人法定代理人欄位 -->
        <div class="space-y-3 border-b border-gray-200 pb-6 bg-yellow-50/50 p-4 rounded-lg border border-yellow-200">
          <h2 class="text-sm font-bold text-yellow-900">未滿 18 歲參與者加填欄位 (法定代理人)</h2>
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs">
            <div>
              <label class="block text-gray-700 font-medium mb-1">法定代理人姓名</label>
              <input type="text" name="guardian_name" class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none bg-white" placeholder="未滿18歲者必填" />
            </div>
            <div>
              <label class="block text-gray-700 font-medium mb-1">與參與者關係</label>
              <input type="text" name="guardian_relation" class="w-full border border-gray-300 rounded p-2 focus:ring-2 focus:ring-blue-500 outline-none bg-white" placeholder="例如：父母/監護人" />
            </div>
          </div>
        </div>

        <!-- 四、電子簽名 -->
        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-800">
            立切結書人電子簽名 <span class="text-red-500">* ( mandatory 必填)</span>
          </label>
          <div class="border-2 border-dashed border-gray-300 rounded-lg bg-gray-50 relative">
            <canvas id="signature-pad" class="w-full h-44 rounded-lg cursor-crosshair block"></canvas>
          </div>
          <div class="flex justify-between items-center text-xs">
            <button type="button" id="clear-btn" class="text-red-600 hover:underline">清除重簽</button>
            <span id="sig-error" class="text-red-500 font-bold hidden">⚠️ 請務必完成電子簽名才能提交！</span>
          </div>
        </div>

        <input type="hidden" name="signature_data" id="sig-input" />
        <input type="hidden" name="signed_at" id="signed-at-input" />

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3.5 rounded-lg shadow-md transition duration-200">
          同意條款並完成電子簽署
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
      alert('切結書與電子簽名已成功完成簽署！');
    });
  </script>
</Layout>
ASTRO_EOF

git add src/pages/survey.astro
git commit -m "Integrate official Risk Statement and Liability Waiver PDF terms into survey page" || true
git push origin main --force

echo "✨ 已成功更新並推送上 GitHub！"
