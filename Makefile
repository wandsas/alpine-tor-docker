#!/usr/bin/env make

.PHONY: run
ALL:	run

build:
	@docker build -t wandsas/torproxy .

run: build
	@docker run -d \
		--name torproxy \
		--hostname torproxy \
		--restart always \
		-p 9050:9050 \
		wandsas/torproxy

test:
	curl --socks http://localhost:9050 \
		-L https://check.torproject.org/api/ip

# vim:fenc=utf-8:ft=make:
