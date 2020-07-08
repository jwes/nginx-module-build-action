# Container image that runs your code
FROM debian:buster-slim

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
	git \
	clang \
	make \
	libpcre3-dev \
	zlibc \
	zlib1g \
	zlib1g-dev

ENTRYPOINT ["/entrypoint.sh"]

