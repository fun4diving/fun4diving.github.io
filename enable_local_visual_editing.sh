#!/bin/bash
set -e

echo "📂 1. 建立 tina 資料夾..."
mkdir -p tina

echo "⚙️ 2. 設定純本地 TinaCMS 視覺化配置..."

cat << 'FILE_EOF' > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
  isLocal: true,
  contentApiUrlOverride: "/api/tina",
  
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
        format: "md",
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
        format: "md",
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

echo "🔨 3. 編譯本地 Tina 靜態檔案..."
TINA_PUBLIC_IS_LOCAL=true npx tinacms build --local

echo "🚀 4. 更新 package.json 啟動腳本..."
npm pkg set scripts.dev:cms="tinacms dev -c \"astro dev\""

git add .
git commit -m "Enable pure local visual editing mode for TinaCMS" || true
git push origin main --force

echo "✨ 本地視覺化編輯模式設定完畢！"
