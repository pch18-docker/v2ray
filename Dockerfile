FROM v2ray/official
MAINTAINER pch18.cn

COPY config.json /etc/v2ray/config.json
COPY caddy.conf /etc/caddy/caddy.conf
COPY run.sh /run.sh

RUN apk update \ 
    && apk add caddy \ 
    && chmod 777 /run.sh
    
ENV DOMAIN ray.domain.com
ENV REDIRECT_URL www.baidu.com
ENV UUID_1 b831381d-6324-4d53-ad4f-8cda48b30811

CMD /run.sh
