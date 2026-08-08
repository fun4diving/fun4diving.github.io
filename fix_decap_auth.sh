#!/bin/bash
set -e

echo "⚙️ 1. 更新 public/admin/index.html（採用獨立免 Netlify 版）..."
cat << 'HTML_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Fun4Diving 內容管理後台</title>
  </head>
  <body>
    <!-- 引入獨立版 Decap CMS，不依賴 netlify-identity -->
    <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
  </body>
</html>
HTML_EOF

echo "⚙️ 2. 更新 public/admin/config.yml（採用相容性認證網關）..."
cat << 'YML_EOF' > public/admin/config.yml
backend:
  name: github
  repo: nike70543/fun4diving-website
  branch: main
  # 使用社群維護的免費 GitHub OAuth 網關，不用自架、不走 Netlify
  base_url: https://decap-cms-oauth-provider.vercel.app
  auth_endpoint: /api/auth

media_folder: "public/uploads"
public_folder: "/uploads"

collections:
  - name: "news"
    label: "最新消息 (News)"
    folder: "src/content/news"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - { label: "標題", name: "title", widget: "string" }
      - { label: "發布日期", name: "date", widget: "datetime" }
      - { label: "封面圖片", name: "image", widget: "image", required: false }
      - { label: "摘要", name: "summary", widget: "text" }
      - { label: "內文", name: "body", widget: "markdown" }

  - name: "courses"
    label: "課程與價目 (Courses)"
    folder: "src/content/courses"
    create: true
    slug: "{{slug}}"
    fields:
      - { label: "課程名稱", name: "title", widget: "string" }
      - { label: "費用 (NTD)", name: "price", widget: "number" }
      - { label: "封面圖", name: "image", widget: "image", required: false }
      - { label: "簡介", name: "description", widget: "text" }
      - { label: "詳細說明", name: "body", widget: "markdown" }
YML_EOF

echo "🚀 3. 推送設定至 GitHub..."
git add public/admin/
git commit -m "Fix Decap CMS OAuth proxy for GitHub Pages" || true
git push origin main --force

echo "✨ 完成！"
