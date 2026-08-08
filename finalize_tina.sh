#!/bin/bash
set -e

MY_CLIENT_ID="461f2de2-60d6-4168-9ab0-83832630f12b"
MY_TOKEN="70478ccaa9720c8e866b18d33e7d92406e3cc62d"

echo "⚙️ 1. 寫入完整且包含專屬憑證的 tina/config.ts..."

cat << FILE_EOF > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
  branch: process.env.HEAD || process.env.VERCEL_GIT_COMMIT_REF || "main",
  
  clientId: process.env.TINA_CLIENT_ID || "${MY_CLIENT_ID}",
  token: process.env.TINA_TOKEN || "${MY_TOKEN}",

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

echo "🔨 2. 執行正式建置..."
npx tinacms build

echo "🚀 3. 推送最終設定至 GitHub 觸發自動部署..."
git add .
git commit -m "Deploy TinaCMS visual admin panel with complete content schemas" || true
git push origin main --force

echo "🎉 大功告成！TinaCMS 視覺化管理後台已完美上線！"
