FROM node:21.7.2-bullseye-slim

RUN mkdir /app/
WORKDIR /app/
RUN npm install pm2 -g
RUN apt update; apt install -y libstdc++6

COPY front-end/ /app/front-end/
WORKDIR /app/front-end/
RUN npm install
RUN npm run-script build

WORKDIR /app/
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install

COPY server.js /app/
COPY probe.js /app/
COPY constants.js /app/
COPY notification.js /app/
COPY database.js /app/
COPY api.js /app/
COPY app.js /app/
COPY utils.js /app/
COPY docker-entrypoint.sh /app/
RUN chmod +x /app/docker-entrypoint.sh
COPY templates /app/templates

USER root

# Start the server
ENTRYPOINT ["/app/docker-entrypoint.sh"]
