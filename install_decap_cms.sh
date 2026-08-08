#!/bin/bash
set -e

echo "📦 1. 在 public 資料夾建立 admin 後台頁面..."
mkdir -p public/admin

# 1. 建立 index.html (CMS 核心與視覺化載入)
cat << 'HTML_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FUN 肆潛水 - 視覺化內容管理系統</title>
    <script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
  </head>
  <body>
    <!-- 引入 Decap CMS 官方視覺化核心 -->
    <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
  </body>
</html>
HTML_EOF

# 2. 建立 config.yml (設定 GitHub 直連與全頁面選單)
cat << 'YML_EOF' > public/admin/config.yml
backend:
  name: github
  repo: nike70543/fun4diving-website
  branch: main

media_folder: "public/uploads"
public_folder: "/uploads"

collections:
  - name: "pages"
    label: "📄 網站頁面 (Pages)"
    files:
      - file: "src/content/pages/index.json"
        label: "🏠 首頁 (Index)"
        name: "index"
        fields:
          - { label: "首頁大標題", name: "hero_title", widget: "string" }
          - { label: "副標題/簡介", name: "hero_subtitle", widget: "text" }
          - { label: "Banner 大圖", name: "hero_banner", widget: "image" }

      - file: "src/content/pages/about.json"
        label: "🌊 關於 Fun 肆潛水 (About)"
        name: "about"
        fields:
          - { label: "頁面標題", name: "title", widget: "string" }
          - { label: "品牌介紹內文", name: "intro", widget: "markdown" }
          - { label: "工作室合照", name: "team_image", widget: "image" }

      - file: "src/content/pages/contact.json"
        label: "📞 聯絡我們 (Contact)"
        name: "contact"
        fields:
          - { label: "聯絡電話", name: "phone", widget: "string" }
          - { label: "LINE ID", name: "line_id", widget: "string" }
          - { label: "潛水店地址", name: "address", widget: "string" }

  - name: "news"
    label: "📰 最新消息 (News)"
    folder: "src/content/news"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - { label: "標題", name: "title", widget: "string" }
      - { label: "發布日期", name: "date", widget: "datetime" }
      - { label: "封面圖片", name: "image", widget: "image" }
      - { label: "內文", name: "body", widget: "markdown" }

  - name: "courses"
    label: "🤿 課程與價目 (Courses)"
    folder: "src/content/courses"
    create: true
    fields:
      - { label: "課程名稱", name: "title", widget: "string" }
      - { label: "費用 (NTD)", name: "price", widget: "number" }
      - { label: "課程封面", name: "image", widget: "image" }
      - { label: "詳細說明", name: "body", widget: "markdown" }
YML_EOF

echo "🚀 2. 推送至 GitHub 儲存庫..."
git add .
git commit -m "Install Decap CMS directly into GitHub project" || true
git push origin main --force

echo "✨ 已完成安裝並推送到 GitHub！"
