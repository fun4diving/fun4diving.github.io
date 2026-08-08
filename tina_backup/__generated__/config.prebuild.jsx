// tina/config.ts
import { defineConfig } from "tinacms";
var config_default = defineConfig({
  branch: "main",
  clientId: process.env.TINA_CLIENT_ID,
  token: process.env.TINA_TOKEN,
  build: {
    outputFolder: "admin",
    publicFolder: "public"
  },
  media: {
    tina: {
      mediaRoot: "uploads",
      publicFolder: "public"
    }
  },
  schema: {
    collections: [
      {
        name: "news",
        label: "\u6700\u65B0\u6D88\u606F (News)",
        path: "src/content/news",
        fields: [
          { type: "string", name: "title", label: "\u6A19\u984C", isTitle: true, required: true },
          { type: "datetime", name: "date", label: "\u767C\u5E03\u65E5\u671F" },
          { type: "image", name: "image", label: "\u5C01\u9762\u5716\u7247" },
          { type: "string", name: "summary", label: "\u6458\u8981", ui: { component: "textarea" } },
          { type: "rich-text", name: "body", label: "\u5167\u6587", isBody: true }
        ]
      },
      {
        name: "courses",
        label: "\u8AB2\u7A0B\u8207\u50F9\u76EE (Courses)",
        path: "src/content/courses",
        fields: [
          { type: "string", name: "title", label: "\u8AB2\u7A0B\u540D\u7A31", isTitle: true, required: true },
          { type: "number", name: "price", label: "\u8CBB\u7528 (NTD)" },
          { type: "image", name: "image", label: "\u5C01\u9762\u5716" },
          { type: "string", name: "description", label: "\u7C21\u4ECB", ui: { component: "textarea" } },
          { type: "rich-text", name: "body", label: "\u8A73\u7D30\u8AAA\u660E", isBody: true }
        ]
      }
    ]
  }
});
export {
  config_default as default
};
