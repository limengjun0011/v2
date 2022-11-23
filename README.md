# 加速、一键BBR执行代码
```wget --no-check-certificate -O tcp.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh && chmod +x tcp.sh && ./tcp.sh```
# debian安装防火墙
```
apt install ufw
ufw allow 22
ufw allow 2222
ufw allow 443
ufw enable
ufw status verbose
ufw disable
   ```

# 1、执行以下代码（对接sspanel）
```mkdir v2ray-agent && cd v2ray-agent && curl https://raw.githubusercontent.com/limengjun0011/v2/master/install.sh -o install.sh && chmod +x install.sh && ./install.sh```
# 2、中转执行以下代码
（1）切换国外源

```
cd /etc/yum.repos.d
``` 
（2）安装
```
wget -O CentOS-Base.repo https://www.halocloud.net/pan/Centos-7.repo
```
（3）清除源缓存并且建立元数据
``` 
yum clean all
yum makecache
``` 
（4）安装iptables
``` 
yum install -y iptables
yum update iptables
yum install iptables-services
``` 
（5）安装brook中转
``` 
wget  -N --no-check-certificate https://zhujiwiki.com/wp-content/uploads/2020/01//brook-pf-mod.sh && chmod +x brook-pf-mod.sh
#启动
./brook-pf-mod.sh
``` 
# 2、中转执行以下代码
``` 
wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/natcfg.sh && chmod +x natcfg.sh && bash natcfg.sh
``` 

# 2.0、中转备份文件
``` 
vi /etc/dnat/conf
``` 

# 2.1、安装Socks5代理脚本

``` 
wget --no-check-certificate https://raw.github.com/Lozy/danted/master/install.sh -O install.sh

bash install.sh  --port=9999 --user=shasha --passwd=13610414
``` 
## 2.1.1、socks的部分命令
- 卸载
``` 
bash install.sh --uninstall
``` 

- service sockd adduser
- service sockd deluser

## 2.1.1、火狐浏览器中安装插件
- 菜单-附件组件-FoxyProxy-安装

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
# 3、如果是腾讯云服务器（卸载腾讯云监控）
``` 
/usr/local/qcloud/stargate/admin/uninstall.sh
/usr/local/qcloud/YunJing/uninst.sh
/usr/local/qcloud/monitor/barad/admin/uninstall.sh
```
# 普通的一键v2ray执行脚本（非面板对接使用）
```wget -N --no-check-certificate -q -O install.sh "https://raw.githubusercontent.com/wulabing/V2Ray_ws-tls_bash_onekey/master/install.sh" && chmod +x install.sh && bash install.sh```
# 三网测速
```bash <(curl -Lso- https://git.io/superspeed)```
# 一键ssr脚本
```wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh```
# 手动安装ss
## 第一步
```wget –no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh```
## 第二步
```chmod +x shadowsocks.sh```
## 第三步
```./shadowsocks.sh 2>&1 | tee shadowsocks.log```

# 4、修改vps的DNS服务器
debian安装nscd
```
apt-get install nscd
apt-get install sudo
sudo /etc/init.d/nscd restart
```

cloudflare：```echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf```
google：```echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf```

# 5、寻找合适的中转机
## 1、落地机安装
```
apt install iperf3 -y
iperf3 -s
```
## 2、中转机安装
```
yum install iperf3 -y
iperf3 -c ip //把ip换成落地机的ip
```

# 手动安装v2ray
```
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
bash install-release.sh
curl -O https://raw.githubusercontent.com/limengjun0011/v2/master/config.json
mv config.json /usr/local/etc/v2ray
systemctl start v2ray
sudo systemctl enable v2ray
cd /etc/systemd/system/v2ray.service.d

cat >> ./10-donot_touch_single_conf.conf <<EOF
Environment="V2RAY_VMESS_AEAD_FORCED=false"
EOF

systemctl daemon-reload
systemctl restart v2ray
```

# open VZ BBR加速
已测试通过的系统： Ubuntu 14.04 x64、Ubuntu 16.04 x64、CentOS 6 x64、CentOS 7 x64 只支持 64 位系统，要求 glibc 版本 2.14 以上。（这里采用centos7）
#适用于单网卡（单IP）服务器：
```
wget https://github.com/tcp-nanqinlang/lkl-rinetd/releases/download/1.1.0/tcp_nanqinlang-rinetd-debianorubuntu.sh
bash tcp_nanqinlang-rinetd-debianorubuntu.sh
```
#如果提示only support OpenVZ !，则使用下面这个脚本
```
wget https://github.com/tcp-nanqinlang/lkl-rinetd/releases/download/1.1.0-nocheckvirt/tcp_nanqinlang-rinetd-debianorubuntu-nocheckvirt.sh
bash tcp_nanqinlang-rinetd-debianorubuntu-nocheckvirt.sh
```


# DDNS
https://www.dynu.com/zh-CN/
```
##Debian/Ubuntu
apt-get update
apt-get install curl -y

##CentOS
yum update -y
yum install curl -y


curl "https://api.dynu.com/nic/update?hostname=您申請的域名&password=您Dynu帳戶的密碼"

## 返回下面信息表示成功 ##
good xxx.xxx.xxx.xxx (IP地址)

crontab -e

*/1 * * * * curl "https://api.dynu.com/nic/update?hostname=您申請的域名&password=您Dynu帳戶的密碼"> /dev/null 2>&1
```

# 阿里DDNS
https://blog.csdn.net/y1534414425/article/details/90699532
```
##For CentOS：
yum install -y wget curl cronie

##For Debian 8+：
apt install -y wget curl cron

##For Ubuntu/Debian 7：
apt-get install -y wget curl cron

##For 然后下载AliDDNS脚本到你的服务器上：
wget -O /usr/sbin/AliDDNS-v2.0.sh [版本对应的下载地址]

##下载地址：
测试版本：https://bitbucket.org/ilemonrain/aliddns/downloads/AliDDNS-v2.0-Beta20180705.sh
最新版本：https://bitbucket.org/ilemonrain/aliddns/downloads/AliDDNS-v2.0.sh
稳定版本：https://bitbucket.org/ilemonrain/aliddns/downloads/AliDDNS-v2.0.sh

## 为脚本文件加上可执行属性： ##
chmod +x /usr/sbin/AliDDNS-v2.0.sh

## 执行脚本，开始配置：
/usr/sbin/AliDDNS-v2.0.sh

## 首先，在命令行执行命令：
crontab -e
## 选择完成后，会打开一个文本编辑器，请在文件的最后添加如下一行：
*/5 * * * * /usr/sbin/AliDDNS-v2.0.sh run >/dev/null 2>&1 &

## 添加完成后，保存退出。当提示 crontab: installing new crontab 时，表示crontab写入成功，执行命令重启cron进程：

## For CentOS：
service crond restart

## For Ubuntu/Debian：
service cron restart

## 并将Cron加入开机启动项：

## For CentOS：
chkconfig crond on

## For Ubuntu/Debian：
systemctl enable cron
```
# 一键v2脚本

```
bash <(curl -s -L https://git.io/v2ray.sh)
```

# V2面板重启

```
cd /root/v2ray-agent && docker-compose restart v2ray
```

# 原版测速脚本

```
wget -O ookla-speedtest.tgz 'https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-x86_64-linux.tgz' && gunzip ookla-speedtest.tgz && tar xvf ookla-speedtest.tar && ./speedtest
```

# ssh修改root登陆权限

```
sudo -i
vi /etc/ssh/sshd_config
passwd root
/etc/init.d/ssh restart
```
# 流量监控

```
yum install -y iptraf
```
# 自动校准时间
```
crontab -e
```

```
00 12 * * * /sbin/ntpdate -u ntp.api.bz
```

# XrayR安装

```
wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/XrayRinstall.sh && chmod +x XrayRinstall.sh && bash XrayRinstall.sh
```
# 修改DM5校验
```
vi /etc/systemd/system/XrayR.service
```
# 替换为以下内容
```
ExecStart=/usr/bin/env xray.vmess.aead.forced=false /usr/local/XrayR/XrayR -config /etc/XrayR/config.yml
```
```
systemctl daemon-reload
```
# 修改配置文件（/etc/XrayR）
```
vi /etc/XrayR/config.yml
```
# 修改配置文件
```
vi /etc/XrayR/custom_inbound.json
```
# tcp协议出口
```
[
    {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "149.129.214.35", 
            "port": 10550
          }
        ]
      }
    }
]
```


# ws协议出口
```
{
	"offset_port_node": 10550,
	"server_sub": "159.223.44.181",
	"host": "159.223.44.181",
	"alter_id": 0,
	"network": "ws",
	"security": "none",
	"path": "/v2ray"
}
```
```
xrayr start
```
# Gost中转

```
wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/KANIKIG/Multi-EasyGost/master/gost.sh && chmod +x gost.sh && ./gost.sh
```

# v2-ui可视化面板

```
bash <(curl -Ls https://raw.githubusercontent.com/limengjun0011/v2/master/install-v2-ui.sh)
```

# tiktok脚本

```
curl -fsL -o ./t.sh.x https://github.com/lmc999/TikTokCheck/raw/main/t.sh.x && chmod +x ./t.sh.x && ./t.sh.x && rm ./t.sh.x
```
# 流媒体解锁脚本

```
bash <(curl -L -s https://git.io/JRw8R) -M 4
```
# 屏蔽360，百度定位，国内外银行等。

```
iptables -F
iptables -A OUTPUT -p tcp -m string --string "dafahao.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "zhengjian.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "zhengjian.org" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "minghui.org" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "dongtaiwang.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "epochtimes.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "epochtimes.org" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "ntdtv.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "ntdtv.org" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "falundafa.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "falundafa.org" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "wujieliulan.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "pbc.gov.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "boc.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "ccb.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "abchina.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "bankcomm.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cdb.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "adbc.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cmbchina.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "spdb.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "ecitic.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "hxb.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cebbank.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cib.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cgbchina.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cmbc.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "cbhb.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "egbank.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "citibank.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "sc.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "hangseng.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "hkbea.com.cn" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "api.map.baidu.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "ps.map.baidu.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "sv.map.baidu.com" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -p tcp -m string --string "newvector.map.baidu.com" --algo bm --to 65535 -j DROP
```

# 一键DD系统在CentOS 7系统下执行DD一键脚本执行：
```
wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/network-reinstall-os.sh && \
chmod +x network-reinstall-os.sh && ./network-reinstall-os.sh
```
```
apt-get install -y xz-utils openssl gawk file wget screen && screen -S os
wget --no-check-certificate -O NewReinstall.sh https://git.io/newbetags && chmod a+x NewReinstall.sh && bash NewReinstall.sh
```


# 修改ssh端口

```
wget https://www.moerats.com/usr/down/sshport.sh
bash sshport.sh
```
#CentOS系统
```
service sshd restart
```
#Debian/Ubuntu系统
```
service ssh restart
```
# 限制linux网速
```
git clone https://github.com/magnific0/wondershaper.git && cd wondershaper
```
#示例
```
    ./wondershaper -a eth0 -d 10240 -u 10240

    ./wondershaper -a eth0 -d 94000 -u 94000  # could be used on a 100Mbps link

    ./wondershaper -a eth0 -u 94000  # only limit upload

    ./wondershaper -c -a eth0

    ./wondershaper -p -f foo.conf
```


