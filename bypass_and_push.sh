#!/bin/bash
set -e

MY_CLIENT_ID="461f2de2-60d6-4168-9ab0-83832630f12b"
MY_TOKEN="70478ccaa9720c8e866b18d33e7d92406e3cc62d"

echo "⚙️ 1. 寫入純本地設定檔（暫不填 ClientID，避免觸發雲端檢查）..."
cat << FILE_EOF > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
  branch: "main",
  clientId: process.env.TINA_CLIENT_ID,
  token: process.env.TINA_TOKEN,

  build: {
    outputFolder: "admin",
    publicFolder: "public",
  },
  media: {
    tina: {
      mediaRoot: "uploads",
      publicFolder: "public",
    },
  },
  schema: {
    collections: [
      {
        name: "news",
        label: "最新消息 (News)",
        path: "src/content/news",
        fields: [
          { type: "string", name: "title", label: "標題", isTitle: true, required: true },
          { type: "datetime", name: "date", label: "發布日期" },
          { type: "image", name: "image", label: "封面圖片" },
          { type: "string", name: "summary", label: "摘要", ui: { component: "textarea" } },
          { type: "rich-text", name: "body", label: "內文", isBody: true },
        ],
      },
      {
        name: "courses",
        label: "課程與價目 (Courses)",
        path: "src/content/courses",
        fields: [
          { type: "string", name: "title", label: "課程名稱", isTitle: true, required: true },
          { type: "number", name: "price", label: "費用 (NTD)" },
          { type: "image", name: "image", label: "封面圖" },
          { type: "string", name: "description", label: "簡介", ui: { component: "textarea" } },
          { type: "rich-text", name: "body", label: "詳細說明", isBody: true },
        ],
      },
    ],
  },
});
FILE_EOF

echo "🔨 2. 本地產生 Schema 檔案..."
npx tinacms build --local

echo "🚀 3. 強制加載並推送 tina/__generated__ 到 GitHub..."
if [ -f .gitignore ]; then
  sed -i '/__generated__/d' .gitignore || true
fi
git add -f tina/__generated__
git add .
git commit -m "Initialize tina schema on main branch" || true
git push origin main --force

echo "✨ 第一階段完成！Schema 已順利推送到 GitHub！"
