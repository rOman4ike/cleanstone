const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    colors: {
      ...colors,
      'primary': {
        500: '#4AD9BD',
        700: '#41C1A9'
      },
      'light': {
        'gray': {
          100: '#F8F8F9',
          300: '#ECEFF4',
          500: '#8A93A3'
        }
      },
      'dark': {
        'gray': {
          700: '#8A93A3',
          800: '#515767',
          900: '#1E1E3C'
        }
      }
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
