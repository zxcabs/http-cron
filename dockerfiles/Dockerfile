FROM mhart/alpine-node:4.2.2
LABEL version="0.0.4"

ADD . /app/

RUN cd /app && npm run init \
	&& rm -rf /app/dockerfiles \
    && rm -rf /var/cache/apk/*

WORKDIR /app

EXPOSE 3434

CMD ["npm", "run", "start"]
