#!/bin/bash
set -e

echo "⚙️ 1. 建立問卷與電子簽名頁面 (src/pages/survey.astro)..."
mkdir -p src/pages

cat << 'ASTRO_EOF' > src/pages/survey.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="問卷與聲明簽署 - FUN 肆潛水">
  <main class="max-w-3xl mx-auto px-4 py-10">
    <h1 class="text-3xl font-bold text-center mb-6">活動問卷與安全聲明</h1>
    <p class="text-gray-600 text-center mb-8">請完整填寫以下問卷資訊，並於下方完成電子簽名。</p>

    <form id="survey-form" class="space-y-6 bg-white p-6 rounded-lg shadow-md border border-gray-100">
      
      <!-- 填寫人姓名 -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">姓名 <span class="text-red-500">*</span></label>
        <input type="text" name="name" required class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="請輸入姓名" />
      </div>

      <!-- 聯絡電話 -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">聯絡電話 <span class="text-red-500">*</span></label>
        <input type="tel" name="phone" required class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="09xx-xxx-xxx" />
      </div>

      <!-- 緊急聯絡人 -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">緊急聯絡人及電話 <span class="text-red-500">*</span></label>
        <input type="text" name="emergency_contact" required class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="聯絡人姓名與電話" />
      </div>

      <!-- 健康與安全聲明確認 -->
      <div class="border-t border-gray-200 pt-4">
        <label class="block text-gray-700 font-medium mb-2">健康狀況評估 <span class="text-red-500">*</span></label>
        <div class="space-y-2">
          <label class="flex items-center space-x-2">
            <input type="checkbox" required class="rounded text-blue-600" />
            <span class="text-sm text-gray-600">我確認目前無心血管疾病、氣喘或不適合潛水運動之身體狀況。</span>
          </label>
          <label class="flex items-center space-x-2">
            <input type="checkbox" required class="rounded text-blue-600" />
            <span class="text-sm text-gray-600">我已瞭解並同意活動相關安全規範與退費條款。</span>
          </label>
        </div>
      </div>

      <!-- 必填：HTML5 電子簽名板 -->
      <div class="border-t border-gray-200 pt-4">
        <label class="block text-gray-700 font-medium mb-1">
          電子簽名 (必填) <span class="text-red-500">*</span>
        </label>
        <p class="text-xs text-gray-500 mb-2">請在下方方框內以滑鼠或手勢進行簽名：</p>
        
        <div class="border-2 border-dashed border-gray-300 rounded-lg bg-gray-50 relative">
          <canvas id="signature-pad" class="w-full h-40 rounded-lg cursor-crosshair block"></canvas>
        </div>
        
        <div class="flex justify-between items-center mt-2">
          <button type="button" id="clear-btn" class="text-xs text-red-600 hover:underline">清除重簽</button>
          <span id="signature-error" class="text-xs text-red-500 hidden">請完成電子簽名！</span>
        </div>
      </div>

      <!-- 隱藏欄位：用來存放簽名圖像 Base64 Data -->
      <input type="hidden" name="signature_data" id="signature-input" />

      <!-- 送出按鈕 -->
      <button type="submit" class="w-full bg-blue-600 text-white font-medium py-3 rounded-lg hover:bg-blue-700 transition duration-200">
        完成簽署並送出
      </button>
    </form>
  </main>

  <!-- 繪圖與簽名邏輯 JavaScript -->
  <script>
    const canvas = document.getElementById('signature-pad');
    const ctx = canvas.getContext('2d');
    const clearBtn = document.getElementById('clear-btn');
    const form = document.getElementById('survey-form');
    const sigInput = document.getElementById('signature-input');
    const sigError = document.getElementById('signature-error');
    
    let isDrawing = false;
    let hasSigned = false;

    // 自適應 Canvas 寬高
    function resizeCanvas() {
      canvas.width = canvas.parentElement.clientWidth;
      canvas.height = 160;
      ctx.lineWidth = 2;
      ctx.strokeStyle = '#000000';
    }
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    // 取得繪圖座標
    function getPos(e) {
      const rect = canvas.getBoundingClientRect();
      const clientX = e.touches ? e.touches[0].clientX : e.clientX;
      const clientY = e.touches ? e.touches[0].clientY : e.clientY;
      return {
        x: clientX - rect.left,
        y: clientY - rect.top
      };
    }

    // 開始繪製
    function startDraw(e) {
      isDrawing = true;
      hasSigned = true;
      sigError.classList.add('hidden');
      const pos = getPos(e);
      ctx.beginPath();
      ctx.moveTo(pos.x, pos.y);
    }

    // 繪製中
    function draw(e) {
      if (!isDrawing) return;
      e.preventDefault();
      const pos = getPos(e);
      ctx.lineTo(pos.x, pos.y);
      ctx.stroke();
    }

    // 停止繪製
    function stopDraw() {
      isDrawing = false;
    }

    // 事件監聽（支援電腦滑鼠與手機觸控）
    canvas.addEventListener('mousedown', startDraw);
    canvas.addEventListener('mousemove', draw);
    canvas.addEventListener('mouseup', stopDraw);

    canvas.addEventListener('touchstart', startDraw);
    canvas.addEventListener('touchmove', draw);
    canvas.addEventListener('touchend', stopDraw);

    // 清除畫布
    clearBtn.addEventListener('click', () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      hasSigned = false;
      sigInput.value = '';
    });

    // 表單送出前進行必填驗證
    form.addEventListener('submit', (e) => {
      if (!hasSigned) {
        e.preventDefault();
        sigError.classList.remove('hidden');
        return;
      }
      // 將畫布轉為圖片 DataURL
      sigInput.value = canvas.toDataURL();
      alert('問卷與簽名已成功送出！');
    });
  </script>
</Layout>
ASTRO_EOF

echo "🚀 2. 推送至 GitHub..."
git add src/pages/survey.astro
git commit -m "Add new survey page with mandatory electronic signature" || true
git push origin main --force

echo "✨ 新問卷與簽名頁面已成功建立！"
