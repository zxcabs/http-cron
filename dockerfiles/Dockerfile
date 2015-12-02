FROM mhart/alpine-node:4.2.2
LABEL version="0.0.3"

ADD . /app/

RUN cd /app && npm run init \
	&& rm -rf /app/dockerfiles \
    && rm -rf /var/cache/apk/*

WORKDIR /app

CMD ["npm", "run", "start"]
