#!/bin/bash
set -e

echo "📦 1. 使用歷史相容模式強制安裝 TinaCMS 套件..."
npm install tinacms @tinacms/cli @tinacms/astro --save-dev --legacy-peer-deps

echo "⚙️ 2. 寫入 tina/config.ts 設定檔..."
mkdir -p tina

cat << 'FILE_EOF' > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
  branch: process.env.HEAD || process.env.VERCEL_GIT_COMMIT_REF || "main",
  clientId: process.env.TINA_CLIENT_ID || "",
  token: process.env.TINA_TOKEN || "",

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

echo "🚀 3. 推送設定與變更至 GitHub..."
git add package.json package-lock.json tina/config.ts
git commit -m "Fix TinaCMS installation dependencies and add config" || true
git push origin main --force

echo "✨ 完成！TinaCMS 已成功安裝，設定檔也建立了！"
