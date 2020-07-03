# 1、执行以下代码
mkdir v2ray-agent  && cd v2ray-agent && curl https://raw.githubusercontent.com/limengjun0011/v2/master/install.sh -o install.sh && chmod +x install.sh && ./install.sh

# 2、中转执行以下代码
wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/brook-pf.sh && chmod +x brook-pf.sh && ./brook-pf.sh

# 3、如果是阿里云服务器（卸载阿里云盾）
wget http://update.aegis.aliyun.com/download/uninstall.sh
sh uninstall.sh
wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
sh quartz_uninstall.sh
