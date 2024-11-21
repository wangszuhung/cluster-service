#!/bin/bash

SQUID_DIR="./squid"

if [[ ! -d "$SQUID_DIR" ]]; then
    echo "Error: '$SQUID_DIR' folder not found."
    exit 1
fi

cd "$SQUID_DIR"

sudo apt update
sudo apt install squid
sudo apt-get install apache2-utils

sudo cp ./squid.conf /etc/squid/squid.conf
sudo systemctl restart squid
sudo systemctl enable squid