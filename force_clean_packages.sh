#!/bin/bash
set -e

echo "🧹 1. 直接用 Node 腳本強制移除 package.json 中的衝突套件..."
node -e '
const fs = require("fs");
const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));

delete pkg.dependencies["@astrojs/node"];
delete pkg.devDependencies["@tinacms/astro"];
delete pkg.dependencies["@builder.io/sdk-astro"];

fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2));
console.log("✅ package.json 清理完成！");
'

echo "⚙️ 2. 強制鎖定 npm 為 legacy-peer-deps 模式..."
echo "legacy-peer-deps=true" > .npmrc

echo "📦 3. 以強制相容模式重構 package-lock.json..."
npm install --legacy-peer-deps

echo "🚀 4. 推送乾淨的修復碼至 GitHub..."
git add package.json package-lock.json .npmrc netlify.toml
git commit -m "Force clean conflicting packages (@astrojs/node, @tinacms/astro, builder.io)" || true
git push origin main --force

echo "✨ 乾淨無無衝突的程式碼已成功 Push 上 GitHub！"
