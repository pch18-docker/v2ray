# v2ray 使用说明

使用`tls+ws+vmess`的方式, 非`v2ray客户端`访问伪装成基于`ws`的`agar.io`游戏网站

`/_ray`地址给`v2ray服务端`使用, 

`/_doc`为文档站, 可以用`UUID`生成`Shadowsocket`和`V2rayU`的导入配置文件

配置新的`uuid`可以直接在环境变量里面添加新字段即可,建议配合`portainer`食用

只要是环境变量以`UUID_`开头的都会自动加`v2ray`到配置里面去

环境变量`PROTOCOL`设置为`https`, 便会使用`DOMAIN`的地址注册`tls`证书,自动开启`https`, 

否则需要配合其他带`https`反向代理使用，可以实现其他站点和梯子共用`443`端口

## 一键部署
### 1. 安装docker (如果已安装可跳过)

根据vps自带wget或者curl **选择其一运行即可**
- `wget -O - https://get.docker.com/ | sh`
- `curl -sSL https://get.docker.com/ | sh`


### 2. 运行`pch18/v2ray`容器
运行成功后，不出意外访问你的域名可以看到`agar.io`的页面。
访问`域名/_doc`可以看到客户端下载页面，在输入框中填写uuid可以生成配置文件
```
docker run -tid --name v2ray -p 443:443 --restart always \ 
-e PROTOCOL="https" \ 
-e DOMAIN="这里写你的域名" \ 
-e UUID_default="这里写你生成的uuid" \ 
pch18/v2ray
```

### 3. （非必须）根据需要可以安装`portainer-ce`可视化管理容器
```
sudo docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --name main-portainer portainer/portainer-ce
```
