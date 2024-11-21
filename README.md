## 1. Clone
```
git clone https://github.com/wangszuhung/cluster-service.git ~/cluster-servic
```
## 2. 調整配置檔
- frpc配置檔[說明](./frpClient/README.md)
- squid配置檔[說明](./squid/README.md)

## 3. Install
```
cd ~/cluster-service && \
sudo ./setup_frpc.sh && \
sudo ./setup_squid.sh
```