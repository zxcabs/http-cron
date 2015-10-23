/**
 * @author "Evgeny Reznichenko" <kusakyky@gmail.com>
 */
import http from 'http';
import connect from 'connect';
import log4js from 'log4js';
import qs from 'qs';
import Queue from 'bull';
import fetch from 'node-fetch';

let
    app = connect(),
    logger = log4js.getLogger(),
    httpQue = Queue('http-delay-queue', 6379, 'redis');

app.use((req, res, next) => {
    req.params = qs.parse(req.url);
    next();
});

app.use((req, res, next) => {
    if (!req.params['/?add']) {
        return res.end('{"success":false}');
    }

    next();
});

app.use(function(req, res) {
    let
        { delay, url } = req.params;

    delay = parseInt(delay, 10);

    if (!delay || delay < 0) {
        delay = 0;
    }

    httpQue
        .add({ url: url }, { delay: delay })
        .then(() => {
            logger.info(`delay: ${delay}; utr: ${url}`);
            res.end('{"success":true}');
        })
        .catch((err) => {
            logger.error(err);
            res.end('{"success":false}');
        });
});

httpQue.process((job) => {
    logger.info(`Send to: ${job.data.url}`);

    return fetch(job.data.url)
            .then(() => {
                logger.info(`Send to: ${job.data.url} - done`);
                job.remove();
                return Promise.resolve();
            })
            .catch((err) => {
                logger.error(err);
                return Promise.reject(err);
            })
});

http.createServer(app).listen(3434, (error) => {
    if (error) return logger.error(error);

    logger.info(`Server run on: ${3434}`);
});

process.on('SIGINT', function() {
    logger.info('SIGINT');
    process.exit();
});
