#!/bin/bash
set -e

MY_CLIENT_ID="461f2de2-60d6-4168-9ab0-83832630f12b"
MY_TOKEN="70478ccaa9720c8e866b18d33e7d92406e3cc62d"

echo "⚙️ 1. 寫入正式 tina/config.ts..."
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

echo "📂 2. 手動建立 tina/__generated__ 目錄與 Basic Schema..."
mkdir -p tina/__generated__

cat << 'SCHEMA_EOF' > tina/__generated__/schema.json
{
  "collections": [
    { "name": "news", "label": "最新消息 (News)", "path": "src/content/news" },
    { "name": "courses", "label": "課程與價目 (Courses)", "path": "src/content/courses" }
  ]
}
SCHEMA_EOF

cat << 'CLIENT_EOF' > tina/__generated__/client.ts
// Temporary fallback client for TinaCloud indexing
export const client = {};
export default client;
CLIENT_EOF

echo "🚀 3. 解除 gitignore 並強制推送 schema 至 GitHub..."
if [ -f .gitignore ]; then
  sed -i '/__generated__/d' .gitignore || true
fi

git add -f tina/
git add .
git commit -m "Bootstrap tina schema manually for TinaCloud indexing" || true
git push origin main --force

echo "✨ 完成！手動 Schema 已成功推送到 GitHub 倉庫！"
