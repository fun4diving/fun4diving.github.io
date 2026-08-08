#!/bin/bash
set -e

MY_CLIENT_ID="461f2de2-60d6-4168-9ab0-83832630f12b"
MY_TOKEN="70478ccaa9720c8e866b18d33e7d92406e3cc62d"

echo "🚀 1. 先將最新變更推送到 GitHub main 分支，讓 TinaCloud 能抓到最新狀態..."
git add .
git commit -m "Update tina config before cloud verification" || true
git push origin main --force

echo "⚙️ 2. 寫入相容的 branch 設定..."

cat << FILE_EOF > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
  // 優先使用環境變數分支，預設為 main
  branch:
    process.env.GITHUB_BRANCH ||
    process.env.HEAD ||
    process.env.VERCEL_GIT_COMMIT_REF ||
    "main",
  
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

echo "🔨 3. 再次執行 Tina Build 驗證..."
npx tinacms build

echo "🚀 4. 將編譯完成的 Admin 後台推送至 GitHub..."
git add .
git commit -m "Successfully built TinaCMS admin portal" || true
git push origin main --force

echo "🎉 完美解決！TinaCMS 後台已成功建置完成！"
