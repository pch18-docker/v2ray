# v2ray 使用说明

使用`tls+ws`的方式, 默认`/_ray`地址给`v2ray`使用,
`/_doc`为文档站, 可以用uuid生成`Shadowsocket`和`V2rayU`的导入配置文件

配置新的`uuid`可以直接在环境变量里面添加新字段即可,配合`portainer`界面使用非常香
只要是环境变量以`UUID_`开头的都会自动加`v2ray`到配置里面去

环境变量`PROTOCOL`设置为`https`, 便会使用`DOMAIN`的地址注册`tls`证书,自动开启`https`