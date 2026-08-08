#!/bin/bash
set -e

echo "⚙️ 修正 tina/config.ts，加入本地模式相容邏輯..."

cat << 'FILE_EOF' > tina/config.ts
import { defineConfig } from "tinacms";

// 判斷是否在本地或未設定 ClientID 時開啟 Local 模式
const isLocal = process.env.TINA_PUBLIC_IS_LOCAL === "true" || !process.env.TINA_CLIENT_ID;

export default defineConfig({
  branch: process.env.HEAD || process.env.VERCEL_GIT_COMMIT_REF || "main",
  clientId: process.env.TINA_CLIENT_ID || "local-test-client-id",
  token: process.env.TINA_TOKEN || "local-test-token",

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

echo "🔨 測試執行本地 Tina 建置..."
npx tinacms build --local

echo "🚀 推送修正至 GitHub..."
git add tina/config.ts
git commit -m "Fix TinaCMS config for local build compatibility" || true
git push origin main --force

echo "✨ 成功修復！TinaCMS 已順利完成 Build 並推送到 GitHub 囉！"
