FROM strapi/base:14

RUN apt-get update && apt install -y nginx

ARG SOURCE_ROOT="./src/main/node"
# Set up working directory that will be used to copy files/directories below :
WORKDIR /entando-strapi

# Copy package.json to root directory inside Docker container of Strapi app
COPY $SOURCE_ROOT/package*.json ./

RUN npm ci

COPY $SOURCE_ROOT .

ENV NODE_ENV production

# RUN npm run build
EXPOSE 8081

COPY strapi.conf .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN echo $(date +%s) > /entando-strapi/build_id

VOLUME /entando-data
WORKDIR /entando-data/entando-strapi
ENTRYPOINT /entando-strapi/entrypoint.sh

#CMD service nginx start && npm run start

# CMD ["npm", "run", "develop"]