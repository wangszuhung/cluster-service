#!/bin/bash

# 確定 FRP 版本
FRP_VERSION="0.61.0"
FRP_URL_BASE="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}"

# 動態偵測系統架構
ARCHITECTURE=$(uname -m)

if [[ "$ARCHITECTURE" == "x86_64" ]]; then
    FRP_ARCH="linux_amd64"
elif [[ "$ARCHITECTURE" == "armv7l" ]]; then
    FRP_ARCH="linux_arm"
elif [[ "$ARCHITECTURE" == "aarch64" ]]; then
    FRP_ARCH="linux_arm64"
else
    echo "Unsupported architecture: $ARCHITECTURE"
    exit 1
fi

FRP_ARCHIVE="frp_${FRP_VERSION}_${FRP_ARCH}.tar.gz"
FRP_URL="${FRP_URL_BASE}/${FRP_ARCHIVE}"

# 確保 FRP 資料夾存在
FRP_DIR="./frpClient"
if [[ ! -d "$FRP_DIR" ]]; then
    echo "Error: '$FRP_DIR' folder not found."
    exit 1
fi

cd "$FRP_DIR"

# 替換配置中的使用者目錄
sed -i "s|/home/<username>|$HOME|g" frp-client.service run.sh

# 賦予執行權限
sudo chmod +x run.sh install-service.sh

# 下載 FRP 並解壓
wget "$FRP_URL"
tar -xvzf "$FRP_ARCHIVE"
rm "$FRP_ARCHIVE"

# 複製解壓後的 frpc 執行檔案
cp frp_${FRP_VERSION}_${FRP_ARCH}/frpc ./frpc
rm -r frp_${FRP_VERSION}_${FRP_ARCH}

# 安裝服務
sudo ./install-service.sh

# ---------------------------------
# #!/bin/bash

# # 確定 FRP 版本
# FRP_VERSION="0.61.0"
# FRP_URL_BASE="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}"

# # 使用命令行參數設置架構
# if [[ "$1" == "64" ]]; then
#     FRP_ARCH="linux_arm64"
# elif [[ "$1" == "32" ]]; then
#     FRP_ARCH="linux_arm"
# else
#     echo "Invalid architecture parameter. Use '64' for 64-bit or '32' for 32-bit."
#     exit 1
# fi

# FRP_ARCHIVE="frp_${FRP_VERSION}_${FRP_ARCH}.tar.gz"
# FRP_URL="${FRP_URL_BASE}/${FRP_ARCHIVE}"

# ./setup_frpc.sh 64    # 用於 64 位元系統
# ./setup_frpc.sh 32    # 用於 32 位元系統

# # 其餘部分與之前相同
# ---------------------------------
# #!/bin/bash

# FRP_DIR="./frpClient"
# FRP_VERSION="0.61.0"
# FRP_ARCH="linux_arm64"
# FRP_ARCHIVE="frp_${FRP_VERSION}_${FRP_ARCH}.tar.gz"
# FRP_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_ARCHIVE}"

# if [[ ! -d "$FRP_DIR" ]]; then
#     echo "Error: '$FRP_DIR' folder not found."
#     exit 1
# fi

# cd "$FRP_DIR"

# sed -i "s|/home/<username>|$HOME|g" frp-client.service run.sh
# sudo chmod +x run.sh install-service.sh

# wget "$FRP_URL"
# tar -xvzf "$FRP_ARCHIVE"
# rm "$FRP_ARCHIVE"
# cp frp_${FRP_VERSION}_${FRP_ARCH}/frpc ./frpc
# rm -r frp_${FRP_VERSION}_${FRP_ARCH}

# sudo ./install-service.sh


