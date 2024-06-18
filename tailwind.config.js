module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],

  theme: {
    fontFamily: {
      biz: ["BIZ UDGothic"],
    },
  },

  plugins: [
    require("daisyui"), ('@tailwindcss/forms'),
],
  }
