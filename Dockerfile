FROM alpine:3.2

ENV NODE_VERSION 4.2.1

ADD ./.babelrc /app/.babelrc
ADD ./package.json /app/package.json
ADD ./index.js /app/index.js
ADD ./src /app/src

RUN apk \
      	--update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main \
       	--update add \
       	nodejs=${NODE_VERSION}-r0 \
    && cd /app && npm run init \
    && rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["npm", "run", "prod"]
