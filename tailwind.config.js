/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_plugins/**/*.rb',
    './**/*.md',
    './*.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['shabnam'],
      }
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
