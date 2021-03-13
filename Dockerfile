FROM v2ray/official
MAINTAINER pch18.cn

ADD config.json /etc/v2ray/config.json.tmp
ADD caddy.conf /etc/caddy/caddy.conf
ADD run.sh /run.sh

RUN apk update && apk add caddy && chmod 777 /run.sh

ENV PROTOCOL https
ENV DOMAIN ray.domain.com
ENV EMAIL pch18@qq.com

ENV RAY_PATH _ray
ENV DOC_PATH _doc
ENV DOC_URL https://pch18-docker.github.io/v2ray/
ENV REDIRECT_URL https://agar.io/
ENV ALTER_ID 64

ENV UUID_default b831381d-6324-4d53-ad4f-8cda48b30811

EXPOSE 443
VOLUME /root/.caddy
CMD /run.sh
