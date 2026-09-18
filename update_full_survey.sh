#!/bin/bash
set -e

cat << 'ASTRO_EOF' > src/pages/survey.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="活動報名與健康聲明書 - FUN 肆潛水">
  <main class="max-w-3xl mx-auto px-4 py-8 text-gray-800">
    <div class="bg-white p-6 sm:p-10 rounded-xl shadow-lg border border-gray-100">
      <h1 class="text-2xl sm:text-3xl font-bold text-center text-blue-900 mb-2">FUN 肆潛水 - 活動報名與健康聲明</h1>
      <p class="text-sm text-gray-500 text-center mb-8">請務必據實填寫以下資訊，並於文末完成 mandatory 電子簽名。</p>

      <form id="full-survey-form" class="space-y-6">
        
        <!-- 基本資料 -->
        <div class="space-y-4 border-b border-gray-200 pb-6">
          <h2 class="text-lg font-semibold text-blue-800 border-l-4 border-blue-600 pl-2">基本資料</h2>
          
          <div>
            <label class="block text-sm font-medium mb-1">參加者姓名 <span class="text-red-500">*</span></label>
            <input type="text" name="name" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="請輸入中文姓名" />
          </div>

          <div>
            <label class="block text-sm font-medium mb-1">聯絡電話 <span class="text-red-500">*</span></label>
            <input type="tel" name="phone" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="09xx-xxx-xxx" />
          </div>

          <div>
            <label class="block text-sm font-medium mb-1">身分證字號 / 護照號碼 <span class="text-red-500">*</span></label>
            <input type="text" name="id_number" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="保險辦理使用" />
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

        <!-- 潛水經驗與裝備需求 -->
        <div class="space-y-4 border-b border-gray-200 pb-6">
          <h2 class="text-lg font-semibold text-blue-800 border-l-4 border-blue-600 pl-2">潛水資格與裝備需求</h2>
          
          <div>
            <label class="block text-sm font-medium mb-1">潛水證照級別 <span class="text-red-500">*</span></label>
            <select name="certification" required class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none">
              <option value="">請選擇證照等級</option>
              <option value="OW">初級潛水員 (OW)</option>
              <option value="AOW">進階潛水員 (AOW)</option>
              <option value="Rescue">救援潛水員</option>
              <option value="DM_Instructor">潛水長 / 教練</option>
              <option value="Freediver">自由潛水員</option>
              <option value="None">無證照 (體驗潛水)</option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-medium mb-1">氣瓶支數 (Approx. Dives)</label>
            <input type="number" name="logged_dives" class="w-full border border-gray-300 rounded-lg p-2.5 focus:ring-2 focus:ring-blue-500 outline-none" placeholder="例如：25" />
          </div>

          <div>
            <label class="block text-sm font-medium mb-1">裝備租借需求 (可多選)</label>
            <div class="grid grid-cols-2 gap-2 text-sm mt-1">
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="BCD" class="rounded text-blue-600" /> <span>BCD 浮力調整裝備</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="Regulator" class="rounded text-blue-600" /> <span>調節器組</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="Wetsuit" class="rounded text-blue-600" /> <span>防寒衣</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="Fins" class="rounded text-blue-600" /> <span>蛙鞋</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="Mask" class="rounded text-blue-600" /> <span>面鏡/呼吸管</span></label>
              <label class="flex items-center space-x-2"><input type="checkbox" name="gear" value="Computer" class="rounded text-blue-600" /> <span>潛水電腦錶</span></label>
            </div>
          </div>
        </div>

        <!-- 健康評估與條款聲明 -->
        <div class="space-y-4 border-b border-gray-200 pb-6">
          <h2 class="text-lg font-semibold text-blue-800 border-l-4 border-blue-600 pl-2">健康狀況與安全聲明</h2>
          <p class="text-xs text-gray-500 leading-relaxed bg-blue-50 p-3 rounded">
            潛水活動具有相當程度之風險，請確認您無心臟病、高血壓、氣喘、耳鼻疾病、懷孕或近期曾進行手術等不適合潛水之醫療紀錄。
          </p>

          <div class="space-y-3 text-sm">
            <label class="flex items-start space-x-2">
              <input type="checkbox" required class="mt-1 rounded text-blue-600" />
              <span>我已詳細閱讀並確認個人健康狀況良好，適合參加水下活動。<span class="text-red-500">*</span></span>
            </label>
            <label class="flex items-start space-x-2">
              <input type="checkbox" required class="mt-1 rounded text-blue-600" />
              <span>我瞭解並同意配合潛水教練與導潛之安全指引，如有違規行為須自負風險。<span class="text-red-500">*</span></span>
            </label>
          </div>
        </div>

        <!-- 必填：電子簽名 -->
        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-800">
            請在此完成電子簽名 <span class="text-red-500">* (必填)</span>
          </label>
          <div class="border-2 border-dashed border-gray-300 rounded-lg bg-gray-50 relative">
            <canvas id="signature-pad" class="w-full h-44 rounded-lg cursor-crosshair block"></canvas>
          </div>
          <div class="flex justify-between items-center text-xs">
            <button type="button" id="clear-btn" class="text-red-600 hover:underline">清除重簽</button>
            <span id="sig-error" class="text-red-500 hidden">⚠️ 必須完成電子簽名才能送出！</span>
          </div>
        </div>

        <input type="hidden" name="signature_data" id="sig-input" />

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3.5 rounded-lg shadow-md transition duration-200">
          確認提交報名表與簽名
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
      alert('資料與簽名已成功記錄！');
    });
  </script>
</Layout>
ASTRO_EOF

git add src/pages/survey.astro
git commit -m "Add full survey form with mandatory canvas signature" || true
git push origin main --force
