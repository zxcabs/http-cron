FROM mhart/alpine-node:4.2.2

ADD ./.babelrc /app/.babelrc
ADD ./package.json /app/package.json
ADD ./index.js /app/index.js
ADD ./src /app/src

RUN cd /app && npm run init \
    && rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["npm", "run", "prod"]
