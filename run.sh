
uuid_list=''
for line in `env|grep '^UUID_.*'`
do 
    uuid=${line#*=}
    uuid_list="${uuid_list},{\"id\":\"${uuid}\",\"alterId\":${ALTER_ID}}"
done
uuid_list="${uuid_list:1}"

wget ${URL_CONFIG} -O /etc/v2ray/v2ray.json
sed -i "s/\$UUID_LIST/${uuid_list}/" /etc/v2ray/v2ray.json
sed -i "s/\$PATH_RAY/${PATH_RAY}/" /etc/v2ray/v2ray.json

caddy run --config /etc/caddy/caddy.conf --adapter caddyfile >&1 &
v2ray --config=/etc/v2ray/v2ray.json
