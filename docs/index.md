<script>
  window.config_host = function(){ document.write(location.host) };
  window.config_path = function(){ document.write('/'+document.cookie.match(/ray_path=([^;]+)/)[1]) };
</script>

# v2ray 使用说明

# 客户端设置  

```
{
  "log": {
    "error": "",
    "loglevel": "debug",
    "access": ""
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "protocol": "socks",
      "settings": {
        "udp": false,
        "auth": "noauth"
      },
      "port": "1080"
    },
    {
      "listen": "127.0.0.1",
      "protocol": "http",
      "settings": {
        "timeout": 360
      },
      "port": "1087"
    }
  ],
  "outbounds": [
    {
      "mux": {
        "enabled": false,
        "concurrency": 8
      },
      "protocol": "vmess",
      "streamSettings": {
        "wsSettings": {
          "path": "<script>config_path()</script>",
          "headers": {
            "host": "<script>config_host()</script>"
          }
        },
        "tlsSettings": {
          "allowInsecure": false
        },
        "security": "tls",
        "network": "ws"
      },
      "tag": "proxy",
      "settings": {
        "vnext": [
          {
            "address": "<script>config_path()</script>",
            "users": [
              {
                "id": "uuidddddddddddddddd",
                "alterId": 0,
                "level": 0,
                "security": "auto"
              }
            ],
            "port": 443
          }
        ]
      }
    },
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {
        "domainStrategy": "AsIs",
        "redirect": "",
        "userLevel": 0
      }
    },
    {
      "tag": "block",
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "none"
        }
      }
    }
  ],
  "dns": {},
  "routing": {
    "settings": {
      "domainStrategy": "AsIs",
      "rules": []
    }
  },
  "transport": {}
}
```


| 设置项 | 值 |
| - | - |
| 服务器 | <script>config_host()</script> |
| 端口 | 443 |
| UUID |  <font color='red'>提供的UUID</font> |
| TLS  | 打开 |
| 允许不安全 | 关闭 |
| 多路复用 | 打开 |
| Fast Open | 打开 | 
| alterId | 4 | 
| 混淆-类型 | websocket 或 ws |
| 混淆-主机名host | <script>document.write(host)</script> |
| 混淆-路径path | <script>document.write('/'+document.cookie.match(/ray_path=([^;]+)/)[1])</script> |
