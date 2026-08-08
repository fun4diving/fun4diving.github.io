#!/bin/bash
set -e

echo "🛑 1. 清理舊進程..."
fuser -k 4001/tcp 9000/tcp 4321/tcp || true

echo "⚙️ 2. 寫入加入 isLocal: true 的 tina/config.ts..."
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
          { type: "string", name: "body", label: "詳細說明", ui: { component: "textarea" } },
        ],
      },
    ],
  },
});
FILE_EOF

echo "🔨 3. 執行本地靜態資產編譯..."
npx tinacms build --local

echo "🚀 4. 啟動本地視覺化開發伺服器..."
npx tinacms dev -c "npx astro dev"
