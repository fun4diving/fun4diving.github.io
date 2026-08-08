#!/bin/bash
set -e

echo "🛠️ 1. 建立 public/admin 資料夾與相關設定檔..."
mkdir -p public/admin
mkdir -p src/content/news
mkdir -p src/content/courses

# 2. 建立 admin/index.html (Decap CMS 前端介面)
cat << 'FILE_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Fun肆潛水 - 視覺化內容管理系統 (CMS)</title>
  <script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
</head>
<body>
  <!-- 載入 Decap CMS 核心腳本 -->
  <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
</body>
</html>
FILE_EOF

# 3. 建立 admin/config.yml (定義可視覺化修改的欄位與內容結構)
cat << 'FILE_EOF' > public/admin/config.yml
backend:
  name: github
  repo: your-github-username/fun4diving-website # 請確保替換為你的 GitHub 專案庫名稱 (如: Jimi/fun4diving-website)
  branch: main

media_folder: "public/uploads"
public_folder: "/uploads"

collections:
  # 最新消息管理
  - name: "news"
    label: "最新消息 (News)"
    folder: "src/content/news"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - { label: "文章標題", name: "title", widget: "string" }
      - { label: "發布日期", name: "date", widget: "datetime" }
      - { label: "封面圖片", name: "image", widget: "image", required: false }
      - { label: "簡短摘要", name: "summary", widget: "text" }
      - { label: "詳細內容", name: "body", widget: "markdown" }

  # 潛水課程與行程價目管理
  - name: "courses"
    label: "潛水課程與價目 (Courses)"
    folder: "src/content/courses"
    create: true
    slug: "{{slug}}"
    fields:
      - { label: "課程/項目名稱", name: "title", widget: "string" }
      - { label: "費用價格 (NTD)", name: "price", widget: "number" }
      - { label: "列表封面圖", name: "image", widget: "image", required: false }
      - { label: "項目特色描述", name: "description", widget: "text" }
      - { label: "詳細說明與注意事項", name: "body", widget: "markdown" }
FILE_EOF

# 4. 推送至 GitHub
echo "🚀 2. 推送 CMS 基礎架構至 GitHub..."
git add public/admin src/content
git commit -m "Add Decap CMS visual management setup and content collections" || true
git push origin main --force

echo "✨ 第一階段檔案建立完成！"
