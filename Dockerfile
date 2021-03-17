FROM alpine
MAINTAINER pch18.cn

ADD caddy.conf /etc/caddy/caddy.conf
ADD run.sh /run.sh

RUN apk add v2ray --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add caddy && chmod 777 /run.sh

ENV PROTOCOL http
ENV DOMAIN ray.domain.com
ENV EMAIL pch18@qq.com

ENV PATH_RAY /_ray
ENV PATH_DOC /_doc
ENV URL_DISGUISE https://agar.io
ENV URL_START_FILE https://raw.githubusercontent.com/pch18-docker/v2ray/master/start.sh
ENV ALTER_ID 64
ENV UUID_default 00000000-0000-0000-0000-000000000000

VOLUME /root/.local
CMD ['/bin/sh', '-c', 'wget -O - ${URL_START_FILE} | sh']
