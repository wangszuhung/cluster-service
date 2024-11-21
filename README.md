## 1. Clone
```
git clone https://github.com/wangszuhung/cluster-service.git ~/cluster-servic
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