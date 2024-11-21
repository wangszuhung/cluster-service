## 配置檔說明 (`squid.conf`)
```
# 代理伺服器的 HTTP 端口
http_port 8964

# 允許 CONNECT 方法處理 HTTPS 流量
acl SSL_ports port 443
acl Safe_ports port 80      # HTTP
acl Safe_ports port 443     # HTTPS
acl CONNECT method CONNECT

# 訪問控制
http_access allow all

# 禁用快取
cache deny all
cache_mem 0 MB
maximum_object_size 0 KB
cache_dir null /tmp

# 日誌設置
access_log /var/log/squid/access.log

# 防止 DNS 重綁定攻擊（可選）
hosts_file /etc/hosts
```
## 更新配置檔並重啟
```
sudo cp ./squid.conf /etc/squid/squid.conf && \
sudo systemctl restart squid && \
sudo systemctl enable squid
```