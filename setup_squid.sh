#!/bin/bash

SQUID_DIR="./squid"

if [[ ! -d "$SQUID_DIR" ]]; then
    echo "Error: '$SQUID_DIR' folder not found."
    exit 1
fi

cd "$SQUID_DIR"

sudo apt update
sudo apt install squid -y 
# 安裝認證管理工具
sudo apt-get install apache2-utils -y
sudo apt-get install vim -y

sudo cp ./squid.conf /etc/squid/squid.conf
sudo systemctl restart squid
sudo systemctl enable squid