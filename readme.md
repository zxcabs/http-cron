# Web client


## Docker

### Build

```
docker build -t http-delay-queue .
```

### Start

```
run --rm -it -p 3434:3434           \
    --link ihavenever-db:redis            \
    http-delay-queue
```
