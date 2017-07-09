#!/usr/bin/env make

.PHONY: run
ALL: build

build:
	@docker build -t wandsas/torproxy .

run:
	@docker run -d \
    --name torproxy \
    --hostname torproxy \
    --restart always \
    -p 9050:9050 \
    wandsas/torproxy

test:
	curl --socks http://192.168.99.100:9050 \
		-L https://check.torproject.org/api/ip
