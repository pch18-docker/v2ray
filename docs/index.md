<script>
  
  function updateConfig() {
    var replaceList = {
      '${config.host}': location.host,
      '${config.path}': '/' + document.cookie.match(/ray_path=([^;]+)/)[1],
      '${config.uuid}': document.getElementById('input_uuid')? document.getElementById('uuid').value : '请填写UUID'
    };
    document.getElementsByTagName('code').forEach(function (code) {
      for (var replaceKey in replaceList) {
        code.innerText.replaceAll(replaceKey, replaceList[replaceKey]);
      }
    });
  }
  updateConfig()
  
</script>

# v2ray 使用说明
请填写UUID来生成配置文件：<input id="input_uuid" onChange="updateConfig()"/>

# 客户端配置


## MacOS 客户端 V2rayU 配置文件
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
          "path": "${config.path}",
          "headers": {
            "host": "${config.host}"
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
            "address": "${config.host}",
            "users": [
              {
                "id": "${config.uuid}",
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

