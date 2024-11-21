#!/bin/bash
systemctl stop frp-client.service
cp frp-client.service /etc/systemd/system/frp-client.service
systemctl daemon-reload
systemctl start frp-client.service
systemctl enable frp-client.service
