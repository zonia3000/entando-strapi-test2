module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS'),
  },
  url: process.env.PUBLIC_BASE_URL + process.env.SERVER_SERVLET_CONTEXT_PATH
  //url: env('PUBLIC_BASE_URL', 'http://localhost:8085') + env('SERVER_SERVLET_CONTEXT_PATH', '/strapi'),
  /*admin: {
    url: '/admin'
  }*/
});
