#!/bin/bash
set -e

# 請在此處替換成你在 TinaCloud (app.tina.io) 看到的真實 ID 與 Token
MY_CLIENT_ID="461f2de2-60d6-4168-9ab0-83832630f12b"
MY_TOKEN="a887860db0c46c9ec389837b54a130e70fe2ed34"

echo "⚙️ 更新 tina/config.ts 並配置正式雲端憑證..."

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

echo "🔨 執行 Tina Build 驗證雲端憑證..."
npx tinacms build

echo "🚀 推送正式建置結果至 GitHub..."
git add .
git commit -m "Configure official TinaCloud ClientID and build admin portal" || true
git push origin main --force

echo "✨ 恭喜！TinaCMS 視覺化管理後台已成功建置並同步至 GitHub！"
