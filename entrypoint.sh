#!/usr/bin/env bash

path=$VMESS_PATH
echo "VMESS_PATH: $path"

# replace $path in /etc/v2ray/config.json
sed -i "s|/vmess_path|${path}|g" /etc/v2ray/config.json

echo "Starting supervisord..."
/usr/bin/supervisord -c /etc/supervisord.conf