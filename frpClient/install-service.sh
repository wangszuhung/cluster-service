#!/bin/bash
# install-service.sh
nohup bash -c "
  systemctl stop frp-client.service
  cp frp-client.service /etc/systemd/system/frp-client.service
  systemctl daemon-reload
  systemctl start frp-client.service
  systemctl enable frp-client.service
" > /tmp/install-service.log 2>&1 &