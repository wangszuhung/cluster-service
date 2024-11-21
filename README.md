## 1. Clone
```
git clone https://github.com/wangszuhung/cluster-service.git ~/cluster-service
```
## 2. Install
```
cd ~/cluster-service && \
sudo -E ./setup_frpc.sh && \
sudo ./setup_squid.sh
```
## 3. 調整配置檔
- frpc配置檔[說明](./frpClient/README.md)
- squid配置檔[說明](./squid/README.md)




## 安裝認證管理工具
sudo apt-get install apache2-utils

## 創建認證文件
sudo htpasswd -c /etc/squid/passwd service

## 如果你需要為其他用戶添加密碼，可以不使用 -c，這樣不會覆蓋現有的文件。
sudo htpasswd /etc/squid/passwd anotheruser
