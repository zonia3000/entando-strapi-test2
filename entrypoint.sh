#!/bin/sh

if [ ! -f "/etc/nginx/sites-enabled/strapi.conf" ]; then
  rm /etc/nginx/sites-enabled/default
  sed -i "s~ENTANDO_CONTEXT_PATH~${SERVER_SERVLET_CONTEXT_PATH}~g" strapi.conf
  mv strapi.conf /etc/nginx/sites-enabled/
fi

service nginx start && npm run build && npm run develop
