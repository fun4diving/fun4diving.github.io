#!/bin/bash
set -e

echo "📦 1. 將 Admin 介面替換為 Sveltia CMS..."
mkdir -p public/admin

cat << 'HTML_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FUN 肆潛水 - 視覺化內容管理</title>
    <!-- 引入 Sveltia CMS 官方核心 -->
    <script src="https://unpkg.com/@sveltia/cms/dist/sveltia-cms.js" type="module"></script>
  </head>
  <body></body>
</html>
HTML_EOF

echo "⚙️ 2. 設定免 Netlify 的 GitHub 軸心配置..."
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

git add public/admin/
git commit -m "Switch to Sveltia CMS for native GitHub Pages OAuth" || true
git push origin main --force

echo "✨ 已切換至 Sveltia CMS 並完成推送！"
