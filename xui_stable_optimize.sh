#!/bin/bash

echo "=== x-ui 稳定优化开始 ==="

# 1. 句柄限制
if ! grep -q "nofile 200000" /etc/security/limits.conf; then
cat >> /etc/security/limits.conf <<EOL
* soft nofile 200000
* hard nofile 200000
EOL
fi

# 2. systemd 限制
sed -i '/DefaultLimitNOFILE/d' /etc/systemd/system.conf
echo "DefaultLimitNOFILE=200000" >> /etc/systemd/system.conf

sed -i '/DefaultLimitNOFILE/d' /etc/systemd/user.conf
echo "DefaultLimitNOFILE=200000" >> /etc/systemd/user.conf

# 3. 系统文件句柄上限
if ! grep -q "fs.file-max" /etc/sysctl.conf; then
echo "fs.file-max = 1000000" >> /etc/sysctl.conf
fi

# 5. 生效内核参数
sysctl -p

# 6. systemd reload
systemctl daemon-reexec
systemctl daemon-reload

# 7. 重启 x-ui（存在才执行）
if systemctl list-units --type=service | grep -q x-ui; then
    systemctl restart x-ui
fi

echo "=== 优化完成 ==="
echo "当前句柄："
ulimit -n
