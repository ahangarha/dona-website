/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.html',
  ],
  darkMode: false,
  theme: {
    extend: {},
    fontFamily: {
      'sans': ['shabnam'],
    }
  },
  variants: {},
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
