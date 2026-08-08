#!/bin/bash
set -e

echo "⚙️ 1. 設定 npm 預設跳過 peer dependencies 嚴格檢查..."
echo "legacy-peer-deps=true" > .npmrc

echo "📦 2. 先手動完成 @tinacms/astro 套件安裝..."
npm install @tinacms/astro --save-dev --legacy-peer-deps

echo "🔑 3. 再次觸發 Tina 官方初始化..."
npx @tinacms/cli@latest init

