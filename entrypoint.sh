#!/bin/sh
rm /etc/nginx/sites-enabled/default
sed -i "s~ENTANDO_CONTEXT_PATH~${SERVER_SERVLET_CONTEXT_PATH}~g" strapi.conf
mv strapi.conf /etc/nginx/sites-enabled/

service nginx start && npm run build && npm run develop
