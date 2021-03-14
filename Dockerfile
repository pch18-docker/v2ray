FROM teddysun/v2ray
MAINTAINER pch18.cn

ADD config.json /etc/v2ray/config.json.tmp
ADD caddy.conf /etc/caddy/caddy.conf
ADD run.sh /run.sh

RUN apk update && apk add caddy && chmod 777 /run.sh

ENV PROTOCOL http
ENV DOMAIN ray.domain.com
ENV EMAIL pch18@qq.com

ENV PATH_RAY /_ray
ENV PATH_DOC /_doc
ENV URL_DISGUISE https://agar.io
ENV ALTER_ID 64

ENV UUID_default 00000000-0000-0000-0000-000000000000

EXPOSE 443
VOLUME /root/.caddy
CMD /run.sh
