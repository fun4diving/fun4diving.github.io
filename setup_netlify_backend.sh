#!/bin/bash
set -e

echo "⚙️ 更新 Decap CMS config.yml 為 Netlify 生態系配置..."

cat << 'YML_EOF' > public/admin/config.yml
backend:
  name: git-gateway
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

git add public/admin/config.yml
git commit -m "Configure Decap CMS to use Netlify Git Gateway" || true
git push origin main --force

echo "✨ 已成功完成 GitHub 推送！"
