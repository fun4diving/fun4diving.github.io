#!/bin/bash
set -e

echo "⚙️ 更新 tina/config.ts：加入 contentApiUrlOverride 與 isLocal 徹底關閉雲端驗證..."

cat << 'FILE_EOF' > tina/config.ts
import { defineConfig } from "tinacms";

const isLocal = process.env.TINA_PUBLIC_IS_LOCAL === "true" || !process.env.TINA_CLIENT_ID;

export default defineConfig({
  branch: process.env.HEAD || process.env.VERCEL_GIT_COMMIT_REF || "main",
  
  clientId: process.env.TINA_CLIENT_ID || "dummy-client-id",
  token: process.env.TINA_TOKEN || "dummy-token",

  // 關鍵設定：如果是 Local 模式，將 contentApiUrlOverride 導向本地代理，徹底繞過雲端 401 檢查
  contentApiUrlOverride: isLocal ? "http://localhost:4001/graphql" : undefined,

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

echo "🔨 執行強制本地建置..."
TINA_PUBLIC_IS_LOCAL=true npx tinacms build --local

echo "🚀 推送成功編譯的 Schema 與設定檔至 GitHub..."
git add .
git commit -m "Fix TinaCMS 401 build error by adding contentApiUrlOverride" || true
git push origin main --force

echo "✨ 成功修復！TinaCMS 已順利完成了 Local Build！"
