#!/bin/sh

# First time start initialization
if [ ! -f "/entando-data/entando-strapi" ]; then
    cp -R /entando-strapi /entando-data
fi

# NGINX placeholder substitution
rm /etc/nginx/sites-enabled/default
sed -i "s~ENTANDO_CONTEXT_PATH~${SERVER_SERVLET_CONTEXT_PATH}~g" /entando-strapi/strapi.conf
mv /entando-strapi/strapi.conf /etc/nginx/sites-enabled/

service nginx start && npm run build && npm run develop
