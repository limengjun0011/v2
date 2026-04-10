#!/bin/bash

echo "=== 句柄优化开始 ==="

# 1. limits.conf
LIMITS="/etc/security/limits.conf"
cp $LIMITS ${LIMITS}.bak

cat >> $LIMITS <<EOF

* soft nofile 200000
* hard nofile 200000
root soft nofile 200000
root hard nofile 200000

EOF

echo "[OK] limits.conf 已写入"

# 2. systemd system.conf
SYSTEM_CONF="/etc/systemd/system.conf"
cp $SYSTEM_CONF ${SYSTEM_CONF}.bak

grep -q "DefaultLimitNOFILE" $SYSTEM_CONF && \
sed -i 's/^#*DefaultLimitNOFILE.*/DefaultLimitNOFILE=200000/' $SYSTEM_CONF || \
echo "DefaultLimitNOFILE=200000" >> $SYSTEM_CONF

echo "[OK] system.conf 已设置"

# 3. systemd user.conf
USER_CONF="/etc/systemd/user.conf"
cp $USER_CONF ${USER_CONF}.bak

grep -q "DefaultLimitNOFILE" $USER_CONF && \
sed -i 's/^#*DefaultLimitNOFILE.*/DefaultLimitNOFILE=200000/' $USER_CONF || \
echo "DefaultLimitNOFILE=200000" >> $USER_CONF

echo "[OK] user.conf 已设置"

# 4. 重新加载 systemd
systemctl daemon-reexec
systemctl daemon-reload

echo "[OK] systemd 已重载"

# 5. 重启 x-ui
systemctl restart x-ui

echo "[OK] x-ui 已重启"

# 6. 检查句柄
PID=$(pidof x-ui)

if [ -n "$PID" ]; then
    echo "=== 当前 x-ui 句柄限制 ==="
    cat /proc/$PID/limits | grep "Max open files"
else
    echo "[WARN] x-ui 进程未找到"
fi

echo "=== 完成 ==="
