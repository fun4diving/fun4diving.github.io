#!/bin/bash
set -e

echo "⚙️ 更新 Pages CMS 設定檔 (.pages.yml)，加入所有單一頁面..."

cat << 'YML_EOF' > .pages.yml
media:
  input: public/uploads
  output: /uploads

content:
  # ─── 1. 文章/列表類 (Collections) ───
  - name: news
    label: 最新消息 (News)
    type: collection
    path: src/content/news
    format: raw
    fields:
      - name: title
        label: 標題
        type: string
        required: true
      - name: date
        label: 發布日期
        type: datetime
      - name: image
        label: 封面圖片
        type: image
      - name: summary
        label: 摘要
        type: string
      - name: body
        label: 內文
        type: rich-text

  - name: courses
    label: 課程與價目 (Course)
    type: collection
    path: src/content/courses
    format: raw
    fields:
      - name: title
        label: 課程名稱
        type: string
        required: true
      - name: price
        label: 費用 (NTD)
        type: number
      - name: image
        label: 封面圖
        type: image
      - name: description
        label: 簡介
        type: string
      - name: body
        label: 詳細說明
        type: rich-text

  # ─── 2. 單一獨立頁面類 (Single Pages) ───
  - name: page_index
    label: 🏠 首頁 (Index)
    type: file
    path: src/content/pages/index.json
    fields:
      - name: hero_title
        label: 首頁大標題
        type: string
      - name: hero_subtitle
        label: 副標題/簡介
        type: string
      - name: hero_banner
        label: 首頁 Banner 大圖
        type: image

  - name: page_about
    label: 🌊 關於 Fun 肆潛水 (About)
    type: file
    path: src/content/pages/about.json
    fields:
      - name: title
        label: 頁面標題
        type: string
      - name: intro
        label: 品牌故事 / 介紹
        type: rich-text
      - name: team_image
        label: 教練團/環境合照
        type: image

  - name: page_contact
    label: 📞 聯絡我們 (Contact)
    type: file
    path: src/content/pages/contact.json
    fields:
      - name: phone
        label: 聯絡電話
        type: string
      - name: line_id
        label: LINE ID
        type: string
      - name: address
        label: 潛水店地址
        type: string
      - name: opening_hours
        label: 營業時間
        type: string

  - name: page_schedule
    label: 📅 活動列表 (Schedule)
    type: file
    path: src/content/pages/schedule.json
    fields:
      - name: announcement
        label: 近期出海/團唱公告
        type: rich-text
YML_EOF

# 建立預設的單頁 JSON 檔（如果不存在的話）
mkdir -p src/content/pages
[ -f src/content/pages/index.json ] || echo '{"hero_title":"FUN 肆潛水","hero_subtitle":"探索蔚藍海底世界"}' > src/content/pages/index.json
[ -f src/content/pages/about.json ] || echo '{"title":"關於我們","intro":"專業潛水教學與器材服務"}' > src/content/pages/about.json
[ -f src/content/pages/contact.json ] || echo '{"phone":"","line_id":"","address":""}' > src/content/pages/contact.json
[ -f src/content/pages/schedule.json ] || echo '{"announcement":"熱門潛水行程規劃中"}' > src/content/pages/schedule.json

git add .
git commit -m "Add index, about, contact, and schedule pages to Pages CMS" || true
git push origin main --force

echo "✨ 已成功將所有頁面同步至 Pages CMS！"
