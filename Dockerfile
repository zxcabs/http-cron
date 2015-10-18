FROM phusion/baseimage:0.9.17

ADD ./build /build

RUN mkdir /app
RUN mkdir /app/src

ADD ./.babelrc      /app/
ADD ./index.js      /app/
ADD ./package.json  /app/
ADD ./src           /app/src

RUN /build/setup-repo.sh   && \
	/build/base.sh         && \
	/build/node.sh         && \
    /build/init.sh         && \
    /build/services.sh     && \
    /build/cleanup.sh

EXPOSE 3434

WORKDIR /app
ENTRYPOINT npm run prod
