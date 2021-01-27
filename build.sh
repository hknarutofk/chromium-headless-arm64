#!/bin/bash
id=`docker run --privileged -d ubuntu:16.04 /sbin/init`
docker exec -it "$id" /bin/bash -c " \
	apt update && \
	apt install chromium-browser chromium-chromedriver -y && \
	rm -rf \
        /var/cache/debconf/* \
        /var/lib/apt/lists/* \
        /var/log/* \
        /var/tmp/* \
        rm -rf /tmp/*"

docker commit "$id" registry.cn-hangzhou.aliyuncs.com/hknaruto/chromium-headless-docker-arm64:87.0.4280.66

