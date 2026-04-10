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

# 4. TCP优化（避免重复写）
if ! grep -q "somaxconn" /etc/sysctl.conf; then
cat >> /etc/sysctl.conf <<EOL

net.core.somaxconn = 65535
net.core.netdev_max_backlog = 65535
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.ip_local_port_range = 1024 65535
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_max_tw_buckets = 5000000
EOL
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
