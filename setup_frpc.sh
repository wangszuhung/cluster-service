#!/bin/bash

FRP_DIR="./frpClient"
FRP_VERSION="0.61.0"
FRP_ARCH="linux_arm64"
FRP_ARCHIVE="frp_${FRP_VERSION}_${FRP_ARCH}.tar.gz"
FRP_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_ARCHIVE}"

if [[ ! -d "$FRP_DIR" ]]; then
    echo "Error: '$FRP_DIR' folder not found."
    exit 1
fi

cd "$FRP_DIR"

sed -i "s|/home/<username>|$HOME|g" frp-client.service run.sh
sudo chmod +x run.sh install_service.sh

wget "$FRP_URL"
tar -xvzf "$FRP_ARCHIVE"
rm "$FRP_ARCHIVE"
cp frp_${FRP_VERSION}_${FRP_ARCH}/frpc ./frpc
rm -r frp_${FRP_VERSION}_${FRP_ARCH}

sudo ./install-service.sh