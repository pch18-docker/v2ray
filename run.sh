#! /bin/bash

uuid_list=''
for line in `env|grep '^UUID_.*'`
do 
    uuid=${line#*=}
    uuid_list="${uuid_list},{\"id\":\"${uuid}\"}"
done
uuid_list="${uuid_list:1}"

cp /etc/v2ray/config.json.tmp /etc/v2ray/config.json
sed -i "s/\$UUID_LIST/${uuid_list}/" /etc/v2ray/config.json

cp /etc/caddy/caddy.conf.tmp /etc/caddy/caddy.conf
sed -i "s/\$DOMAIN/${DOMAIN}/" /etc/caddy/caddy.conf
sed -i "s/\$MAIL/${MAIL}/" /etc/caddy/caddy.conf

caddy -agree -conf /etc/caddy/caddy.conf >&1 &
v2ray -config=/etc/v2ray/config.json 