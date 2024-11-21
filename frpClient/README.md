## 配置檔說明 (`frpc.toml`)
```
serverAddr = "service.stockwind.win"  // frp server
serverPort =                         // port

[[proxies]]
name = "ssh"           // 連線名稱，可以自訂
type = "tcp"           
localIP = "127.0.0.1"  
localPort = 22         // 轉發本地的 ssh port
remotePort =           // 轉發到server的port

[[proxies]]
name = "proxy"         // 連線名稱，可以自訂
type = "tcp"
localIP = "127.0.0.1"
localPort = 8964       // 轉發本地的 ssh port
remotePort =           // 轉發到server的port
```
## 更新frp-client的配置檔並重啟
```
sudo ./install-service.sh
```