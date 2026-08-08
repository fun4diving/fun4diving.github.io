import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://nike70543.github.io',
  base: '/fun4diving-website',
  integrations: [tailwind()],
});
