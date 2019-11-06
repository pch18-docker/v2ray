FROM v2ray/official
MAINTAINER pch18.cn

COPY config.json /etc/v2ray/config.json
COPY caddy.conf /etc/caddy/caddy.conf
COPY run.sh /run.sh

RUN apk update \ 
    && apk add caddy \ 
    && chmod 777 /run.sh
    
ENV REDIRECT_URL www.baidu.com
ENV UUID_1 375baaa1-e56b-4e40-8a08-b633af3a4bfe

CMD /run.sh
