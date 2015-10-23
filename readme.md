# HTTP CRON

Делает отложенные запросы на переданные урл 

## Docker

### Build

```
docker build -t http-cron .
```

### Start

```
run --rm -it -p <port>:3434                  \
    --link <redis>:redis                     \
    --add-host=<host callback>:<ip callback> \
    --name="http-cron-process"               \
    http-cron
```
