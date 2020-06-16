# Container image that runs your code
FROM debian:buster-slim

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
	git \
	clang \
	make

ENTRYPOINT ["/entrypoint.sh"]

