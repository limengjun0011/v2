# 1、执行以下代码
mkdir v2ray-agent  && cd v2ray-agent && curl https://raw.githubusercontent.com/limengjun0011/v2/master/install.sh -o install.sh && chmod +x install.sh && ./install.sh

#2、中转以下代码
wget -N --no-check-certificate https://raw.githubusercontent.com/limengjun0011/v2/master/brook-pf.sh && chmod +x brook-pf.sh && ./brook-pf.sh
