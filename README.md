# 加速、一键BBR执行代码
```wget --no-check-certificate -O tcp.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh && chmod +x tcp.sh && ./tcp.sh```

# 1、执行以下代码（对接sspanel）
```mkdir v2ray-agent && cd v2ray-agent && curl https://raw.githubusercontent.com/limengjun0011/v2/master/install.sh -o install.sh && chmod +x install.sh && ./install.sh```

# 2、中转执行以下代码
```wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/brook-pf.sh && chmod +x brook-pf.sh && ./brook-pf.sh``` 

# 3、如果是阿里云服务器（卸载阿里云盾）
``` 
wget http://update.aegis.aliyun.com/download/uninstall.sh
sh uninstall.sh
wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
sh quartz_uninstall.sh
```

```
pkill aliyun-service
rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
rm -rf /usr/local/aegis*
```

```
iptables -I INPUT -s 140.205.201.0/28 -j DROP
iptables -I INPUT -s 140.205.201.16/29 -j DROP
iptables -I INPUT -s 140.205.201.32/28 -j DROP
iptables -I INPUT -s 140.205.225.192/29 -j DROP
iptables -I INPUT -s 140.205.225.200/30 -j DROP
iptables -I INPUT -s 140.205.225.184/29 -j DROP
iptables -I INPUT -s 140.205.225.183/32 -j DROP
iptables -I INPUT -s 140.205.225.206/32 -j DROP
iptables -I INPUT -s 140.205.225.205/32 -j DROP
iptables -I INPUT -s 140.205.225.195/32 -j DROP
iptables -I INPUT -s 140.205.225.204/32 -j DROP
```

# 3、如果是腾讯云服务器（卸载阿里云盾）
``` 
/usr/local/qcloud/stargate/admin/uninstall.sh
/usr/local/qcloud/YunJing/uninst.sh
/usr/local/qcloud/monitor/barad/admin/uninstall.sh
```

# 普通的一键v2ray执行脚本（非面板对接使用）
```bash <(curl -s -L https://git.io/v2ray.sh)```

