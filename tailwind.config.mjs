/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        ocean: {
          950: '#030712',
          900: '#0b1329',
          800: '#112240',
          700: '#1d3557',
          400: '#38bdf8',
          300: '#7dd3fc',
        },
        cyan: {
          400: '#22d3ee',
          500: '#06b6d4',
          600: '#0891b2',
        }
      }
    },
  },
  plugins: [],
};
