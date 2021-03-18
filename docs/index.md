# v2ray 使用说明

请先填写UUID后查看配置：
<input id="input_uuid" style="width: 100%;" onkeyup="updateConfig()" maxlength="36" />


## Vmess 配置设置

<input id="input_config" style="width: 100%;" onclick="config_click()" readonly />
<span id="input_config_copied" style="color:red;display:none">已复制</span>
<div id="qrcode" ></div>



<script src="qrcode.min.js"></script>

<script>
  var url_uuid = location.search.substr(1).trim()
  if(url_uuid.match(/^\w{8}(-\w{4}){3}-\w{12}$/)){
    document.getElementById('input_uuid').value = url_uuid;
  }else if(localStorage){
    document.getElementById('input_uuid').value = localStorage.input_uuid || '';
  }
  
  var qr = new QRCode(document.getElementById("qrcode"), '');

  updateConfig()
  
  function updateConfig() {
    document.getElementById('input_config_copied').style.display = 'none'
    
    var uuid = document.getElementById('input_uuid').value.trim();
    var codeEle = document.getElementsByTagName('code')[0];
    
    if(!uuid.match(/^\w{8}(-\w{4}){3}-\w{12}$/)) {
      document.getElementById('input_config').value = '请先正确填写 UUID ！！';
      qr.clear()
      return 0;
    }
    
    if(localStorage){
      localStorage.input_uuid = uuid;
    }
    
    var config = {
      host: location.host,
      path: document.cookie.match(/path_ray=([^;]+)/)[1],
      uuid: uuid || '请填写UUID'
    };
    
    var config_query = JSON.stringify({
        v: "2",
        ps: config.host,
        add: config.host,
        port: "443",
        id: config.uuid,
        aid: "0",
        net: "ws",
        type: "none",
        host: config.host,
        path: "/",
        tls: config.path
    });
    var config_URL = 'vmess://' + window.btoa(config_query);
    

    document.getElementById('input_config').value = config_URL;
    qr.makeCode(config_URL)
    
  }
  
  function config_click(){
    document.getElementById('input_config').select()
    document.getElementById('input_config_copied').style.display = 'block'
    document.execCommand("copy")
  }
</script>




