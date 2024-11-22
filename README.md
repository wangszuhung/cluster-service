## 1. Clone
```
sudo apt-get install git -y
git clone https://github.com/wangszuhung/cluster-service.git ~/cluster-service
```
## 2. Install
```
cd ~/cluster-service && \
sudo -E ./setup_frpc.sh && \
sudo ./setup_squid.sh
```
## 3. 創建帳密(創建認證文件):
```
sudo htpasswd -c /etc/squid/passwd service
```
## 3. 調整配置檔
- frpc配置檔[說明](./frpClient/README.md)
	- 修改後	
	serverPort = 
	remotePort =
```
sudo ./install-service.sh
```
- squid配置檔[說明](./squid/README.md)


## Other

### 如果你需要為其他用戶添加密碼，可以不使用 -c，這樣不會覆蓋現有的文件。
sudo htpasswd /etc/squid/passwd anotheruser

### 看squid log
sudo tail -f /var/log/squid/access.log