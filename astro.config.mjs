import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://fun4diving.github.io',
  base: '/',
  integrations: [tailwind()],
});
