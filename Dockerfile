FROM v2ray/official
MAINTAINER pch18.cn

COPY config.json /etc/v2ray/config.json.tmp
COPY caddy.conf /etc/caddy/caddy.conf
COPY run.sh /run.sh
COPY README.md /www/down/使用说明.md

RUN apk update && apk add caddy && chmod 777 /run.sh

ENV DOMAIN ray.domain.com
ENV EMAIL name@mail.com
ENV REDIRECT_URL https://agar.io/
ENV RAY_PATH _ray

ENV UUID_1 b831381d-6324-4d53-ad4f-8cda48b30811

EXPOSE 443
VOLUME /root/.caddy
CMD /run.sh
