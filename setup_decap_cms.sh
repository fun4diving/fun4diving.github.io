#!/bin/bash
set -e

echo "🧹 1. 清理舊的 TinaCMS 雜物..."
rm -rf tina tina_backup .npmrc setup_tinacms.sh force_setup_tina.sh fix_tina_install.sh start_tina_local.sh fix_tina_config_local.sh fix_tina_pure_local.sh fix_tina_401.sh fix_tina_credentials.sh finish_tina_setup.sh fix_tina_branch.sh push_tina_schema.sh force_push_generated.sh fix_final_deploy.sh bypass_and_push.sh restore_and_build.sh manual_schema_push.sh tina_login_sync.sh reset_and_reinit.sh fix_init_deps.sh finalize_tina.sh

echo "📂 2. 建立 Decap CMS 後台目錄..."
mkdir -p public/admin

echo "⚙️ 3. 建立 Decap CMS 控制面板 (public/admin/index.html)..."
cat << 'HTML_EOF' > public/admin/index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Fun4Diving 內容管理後台</title>
    <script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
  </head>
  <body>
    <!-- 引入 Decap CMS 核心腳本 -->
    <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
  </body>
</html>
HTML_EOF

echo "⚙️ 4. 建立 Decap CMS 欄位結構 (public/admin/config.yml)..."
cat << 'YML_EOF' > public/admin/config.yml
backend:
  name: github
  repo: nike70543/fun4diving-website
  branch: main

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

echo "🚀 5. 將乾淨的新後台推送至 GitHub..."
git add .
git commit -m "Switch CMS solution to Decap CMS (GitHub native backend)" || true
git push origin main --force

echo "✨ 成功替換！乾淨俐落的 Decap CMS 已經設定完畢並推送上線！"
