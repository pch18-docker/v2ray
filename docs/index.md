# v2ray 使用说明

请先填写UUID后查看配置：
<input id="input_uuid" onkeypress="updateConfig()" style="width: 100%;" />


## Vmess 配置设置

<input id="input_config" style="width: 100%;" readonly />




<script>
  
  if(localStorage){
    document.getElementById('input_uuid').value = localStorage.input_uuid || '';
  }
  updateConfig();
  
  function updateConfig() {
    var uuid = document.getElementById('input_uuid').value.trim();
    var codeEle = document.getElementsByTagName('code')[0];
    
    if(!uuid.match(/^\w{8}(-\w{4}){3}-\w{12}$/)) {
      document.getElementById('input_config').value = '请先正确填写 UUID ！！';
      return 0;
    }
    
    if(localStorage){
      localStorage.input_uuid = uuid;
    }
    
    var config = {
      host: location.host,
      path: '/' + document.cookie.match(/ray_path=([^;]+)/)[1],
      uuid: uuid || '请填写UUID'
    };
    
    var config_URL = 'vmess://auto:' + config.uuid + '@' + config.host + ':443';
    var config_query = {
      network: 'ws',
      obfs: 'websocket',
      
      path: config.path,
      h2path: config.path,
      
      mux: 1,
      tfo: 1, // TCP Fast Open
      allowInsecure: 0,
      
    };
    

    document.getElementById('input_config').value = 
        config_URL + '?' + Object.keys(config_query).map(k=>encodeURIComponent(k) + '=' + encodeURIComponent(config_query[k])).join('&');
  }
  
</script>





