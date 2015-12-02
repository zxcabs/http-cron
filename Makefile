run-dev:
	-docker rm -f http-cron-process-dev
	-docker rmi -f http-cron-dev
	docker build -t http-cron-dev -f dockerfiles/Dockerfile .
	docker run --rm -it --name="http-cron-process-dev"  http-cron-dev /bin/sh

.PHONY: run-dev
