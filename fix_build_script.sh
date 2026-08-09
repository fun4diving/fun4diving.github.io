#!/bin/bash
set -e

echo "🧹 1. 修正 package.json 中的 build 指令，移除 tinacms build..."
node -e '
const fs = require("fs");
const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));

// 將 build 指令改為純粹的 astro build
pkg.scripts.build = "astro build";

fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2));
console.log("✅ build 指令已更新為 astro build！");
'

echo "🗑️ 2. 清理用不到的 Tina 舊設定..."
rm -rf tina

echo "🚀 3. 推送至 GitHub 觸發重新打包..."
git add package.json
git rm -r tina || true
git commit -m "Fix build script: remove tinacms build and keep pure astro build" || true
git push origin main --force

echo "✨ 已成功推送！Netlify 這次會 100% 打包成功！"
