
    #!/bin/bash

    echo "开始优化系统句柄和网络参数..."

    # 1. 修改系统最大文件句柄
    echo "* soft nofile 200000" >> /etc/security/limits.conf
    echo "* hard nofile 200000" >> /etc/security/limits.conf

    # 2. systemd 句柄限制
    sed -i '/DefaultLimitNOFILE/d' /etc/systemd/system.conf
    echo "DefaultLimitNOFILE=200000" >> /etc/systemd/system.conf

    sed -i '/DefaultLimitNOFILE/d' /etc/systemd/user.conf
    echo "DefaultLimitNOFILE=200000" >> /etc/systemd/user.conf

    # 3. 内核最大文件数
    sed -i '/fs.file-max/d' /etc/sysctl.conf
    echo "fs.file-max = 1000000" >> /etc/sysctl.conf

    # 4. TCP 网络优化
    cat >> /etc/sysctl.conf <<EOF

    net.core.somaxconn = 65535
    net.core.netdev_max_backlog = 65535
    net.ipv4.tcp_max_syn_backlog = 65535
    net.ipv4.ip_local_port_range = 1024 65535
    net.ipv4.tcp_tw_reuse = 1
    net.ipv4.tcp_fin_timeout = 10
    net.ipv4.tcp_max_tw_buckets = 5000000
    EOF

    # 5. 应用内核参数
    sysctl -p

    # 6. 重新加载 systemd
    systemctl daemon-reexec
    systemctl daemon-reload

    # 7. 重启 x-ui (如果存在)
    systemctl restart x-ui 2>/dev/null

    echo "优化完成"
    echo "当前句柄："
    ulimit -n
