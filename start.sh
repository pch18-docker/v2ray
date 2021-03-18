URL_CADDY_CONFIG=https://raw.githubusercontent.com/pch18-docker/v2ray/master/caddy.conf
URL_V2RAY_CONFIG=https://raw.githubusercontent.com/pch18-docker/v2ray/master/v2ray.json

# 拉取caddy配置, 执行
wget ${URL_CADDY_CONFIG} -O /etc/caddy/caddy.conf
caddy run --config /etc/caddy/caddy.conf --adapter caddyfile >&1 &

# 拉取v2ray配置模板, 写入uuid信息, 执行
wget ${URL_V2RAY_CONFIG} -O /etc/v2ray/v2ray.json
uuid_list=''
for line in `env|grep '^UUID_.*'`
do 
    uuid=${line#*=}
    email=${${line%=*}#UUID_}
    uuid_list="${uuid_list},{\"id\":\"${uuid}\",\"email\":\"${email}\",\"alterId\":${ALTER_ID}}"
done
uuid_list="${uuid_list:1}"
sed -i "s/\$UUID_LIST/${uuid_list}/" /etc/v2ray/v2ray.json
sed -i "s/\$PATH_RAY/\\${PATH_RAY}/" /etc/v2ray/v2ray.json
v2ray --config=/etc/v2ray/v2ray.json
