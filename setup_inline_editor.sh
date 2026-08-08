#!/bin/bash
set -e

echo "🧹 1. 清理舊進程..."
fuser -k 4001/tcp 9000/tcp 4321/tcp || true

echo "🚀 2. 啟動 Astro 官方原生開發伺服器..."
npx astro dev --host
