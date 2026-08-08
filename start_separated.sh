#!/bin/bash
set -e

echo "🛑 1. 清理舊進程..."
fuser -k 4001/tcp 9000/tcp 4321/tcp || true

echo "⚙️ 2. 寫入免雲端驗證 tina/config.ts..."
cat << 'FILE_EOF' > tina/config.ts
import { defineConfig } from "tinacms";

export default defineConfig({
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
          { type: "string", name: "body", label: "詳細說明", ui: { component: "textarea" } },
        ],
      },
    ],
  },
});
FILE_EOF

echo "🚀 3. 獨立啟動 Tina 本地 GraphQL 伺服器 (Port 4001)..."
npx tinacms dev --only-host &

sleep 3

echo "🚀 4. 啟動 Astro 開發網站 (Port 4321)..."
npx astro dev --host
