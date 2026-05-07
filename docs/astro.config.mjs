import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";

// Project page is served at /table-sft-eacl-2026/ on GitHub Pages.
export default defineConfig({
  site: "https://dnaihao.github.io",
  base: "/table-sft-eacl-2026",
  trailingSlash: "ignore",
  integrations: [tailwind()],
});
