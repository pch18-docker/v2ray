# v2ray 使用说明

请先填写UUID：<input id="input_uuid" onChange="updateConfig()"/>

# 客户端配置


## MacOS 客户端 V2rayU 配置
```
请先正确填写 UUID ！！
```
  
## IOS 客户端 Shadowrocket 配置
```
请先正确填写 UUID ！！
```


<script>
  
  if(localStorage){
    document.getElementById('input_uuid').value = localStorage.input_uuid || '';
  }
  updateConfig();
  
  function updateConfig() {
    var uuid = document.getElementById('input_uuid').value.trim();
    var codeEle = document.getElementsByTagName('code');
    var codeEle_V2rayU = codeEle[0];
    var codeEle_Shadowrocket = codeEle[1];
    
    if(!uuid.match(/\w{8}(-\w{4}){3}-\w{12}/)) {
      codeEle_V2rayU.innerHTML = '请先正确填写 UUID ！！'
      codeEle_Shadowrocket.innerHTML = '请先正确填写 UUID ！！'
      return 0;
    }
    
    if(localStorage){
      localStorage.input_uuid = uuid
    }
    
    var config = {
      host: location.host,
      path: '/' + document.cookie.match(/ray_path=([^;]+)/)[1],
      uuid: document.getElementById('input_uuid').value.trim() || '请填写UUID'
    };
    
    var config_V2rayU = 'vmess://' + window.btoa(JSON.stringify({
      "port": "443",
      "ps": "default",
      "tls": "tls",
      "id": config.uuid,
      "aid": "0",
      "v": "2",
      "host": config.host,
      "type": "none",
      "path": "/_ray",
      "net": "ws",
      "add": config.host
    }));
    
    var config_Shadowrocket = 'vmess://' + window.btoa('auto:' + config.uuid + '@' + config.host + ':443') + 
                              '?path=' + config.path + '&obfs=websocket&tls=1&tfo=1&mux=1';
    
    codeEle_V2rayU.innerHTML = config_V2rayU;
    codeEle_Shadowrocket.innerHTML = config_V2rayU;
  }
  
</script>





