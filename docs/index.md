# v2ray 使用说明

# 客户端设置  

| 设置项 | 值 |
| - | - |
| 服务器 | <script>document.write(location.host)</script> |
| 端口 | 443 |
| UUID |  指定UUID |
| TLS  | 打开 |
| 允许不安全 | 关闭 |
| 混淆-名称 | websocket |
| 混淆-路径 | <script>document.write(document.cookie.match(/ray_path=([^;]+)/)[1])</script> |
| 多路复用 | 打开 |
| Fast Open | 打开 | 

# 服务器设置  

设置端口 `443:443`  

设置环境变量  

| 名称 | 值 |
|-|-|
| DOMAIN | 域名 |
| EMAIL | 申请证书时邮箱 |
| RAY_PATH | ray的请求地址 |
| UUID_1 | 标准uuid4 | 
| UUID_2 | 标准uuid4 | 
| UUID_X | 标准uuid4 | 
