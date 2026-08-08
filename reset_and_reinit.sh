#!/bin/bash
set -e

echo "🧹 1. 暫時備份並移除現有 tina 設定..."
rm -rf tina_backup
if [ -d tina ]; then
  mv tina tina_backup
fi

echo "🔑 2. 重新觸發 Tina 官方互動初始化與 GitHub App 授權..."
npx @tinacms/cli@latest init

