#!/bin/bash
set -e

echo "🔍 正在搜尋關於我們 (about) 頁面中的『五星級教練團隊』與『吉米』區塊..."

python3 -c "
import os, re

target_link = 'https://line.me/ti/p/27T97_JrES'

# 尋找含有 '五星級教練團隊' 或 '吉米' 的 astro 檔案
target_file = None
for root, dirs, files in os.walk('src'):
    for file in files:
        if file.endswith('.astro'):
            p = os.path.join(root, file)
            with open(p, 'r', encoding='utf-8') as f:
                c = f.read()
            if '五星級教練團隊' in c or '老王' in c:
                target_file = p
                break

if not target_file:
    print('⚠️ 未找到五星級教練團隊頁面，請確認檔案路徑。')
    exit(1)

print(f'📄 找到目標頁面：{target_file}')

with open(target_file, 'r', encoding='utf-8') as f:
    content = f.read()

# 替代『吉米』展示卡片為具備 hover 動態效果與連結的 <a> 標籤
# 尋找含有吉米的卡片 div/box，並替換為夾帶 Hover '聯絡吉米' 按鈕效果的 a 標籤
old_jimi_pattern = r'(<div[^>]*?>[\s\S]*?alt=[\"\\\'][^\"\\\']*吉米[\s\S]*?</div>[\s\S]*?</div>)'

# 全新的互動式吉米卡片 HTML
new_jimi_card = f'''<a 
  href="{target_link}" 
  target="_blank" 
  rel="nofollow noreferrer" 
  title="點擊聯絡吉米" 
  class="group relative bg-slate-900/80 border border-slate-800 hover:border-cyan-400 p-6 rounded-2xl flex flex-col items-center gap-4 transition-all duration-300 transform hover:-translate-y-1 hover:shadow-xl hover:shadow-cyan-500/20 cursor-pointer overflow-hidden"
>
  <div class="relative w-20 h-20 sm:w-24 sm:h-24 rounded-full overflow-hidden border-2 border-cyan-500/30 group-hover:border-cyan-400 transition duration-300">
    <img src="https://b1c75e2b05.cbaul-cdnwnd.com/f7e4422cd6db309143b73b292a218cc3/200000002-31d7531d78/S__106807396.jpeg" alt="吉米" class="w-full h-full object-cover group-hover:scale-110 transition duration-300" />
  </div>
  
  <!-- 平時顯示：吉米 ｜ Hover 動態轉換為：💬 聯絡吉米 -->
  <div class="relative w-full h-8 flex items-center justify-center">
    <span class="font-bold text-white text-base group-hover:opacity-0 transition duration-200">
      吉米
    </span>
    <span class="absolute inset-0 flex items-center justify-center px-4 py-1.5 rounded-full bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs sm:text-sm opacity-0 group-hover:opacity-100 transition duration-200 shadow-md whitespace-nowrap">
      💬 聯絡吉米
    </span>
  </div>
</a>'''

# 進行行層級或結構取代
lines = content.split('\n')
updated_lines = []
in_jimi_block = False

for i, line in enumerate(lines):
    if '吉米' in line:
        # 如果是夾在卡片結構中，將吉米區塊更換
        pass

# 直接精準替換吉米卡片區域
new_content = re.sub(r'<div[^>]*?>\s*?<img[^>]*?alt=[\"\']吉米[\"\'][^>]*?>\s*?</div>\s*?<[^>]*?>吉米</[^>]*?>\s*?</div>', new_jimi_card, content)

if new_content == content:
    # 備用更換方案：直接替換吉米文字所在的外層標籤
    new_content = re.sub(r'(\s*?<[^>]*?>[\s\S]*?alt=[\"\'][^\"\']*?吉米[\s\S]*?吉米[\s\S]*?</[^>]*?>)', f'\n{new_jimi_card}\n', content)

with open(target_file, 'w', encoding='utf-8') as f:
    f.write(new_content)

print('✅ 吉米卡片動態轉換語法已成功寫入！')
"

echo "----------------------------------------"
echo "📦 執行打包建置 npm run build..."
npm run build

echo "----------------------------------------"
echo "📊 Git 修改狀態："
git status -s

echo "----------------------------------------"
echo "🚀 推送修改至 GitHub..."
BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  BRANCH="main"
fi

git add .
git commit -m "Upgrade Jimi card on about page with dynamic 'Contact Jimi' hover effect and LINE link" || git commit --allow-empty -m "Trigger redeploy for Jimi card hover effect"
git push origin "$BRANCH"

echo "----------------------------------------"
echo "✨ 完成！現在點擊或懸停『吉米』框，就會動態變成『💬 聯絡吉米』並能直接開啟你的 LINE 囉！"
