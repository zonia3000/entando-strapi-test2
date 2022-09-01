module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT'),
  },
  //url: '/entando-strapi',
  //url: '/entando',
  //url: env('SERVER_SERVLET_CONTEXT_PATH', '/entando-strapi') + '/dashboard',
});
