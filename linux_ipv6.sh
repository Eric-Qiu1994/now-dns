#!/bin/bash

# 使用curl获取6.ipw.cn的值，并将其赋值给变量IP
hostip=$(curl -s 6.ipw.cn)

#apt-get install dnsutils

#域名变量
domain="your_domains"

# 获取域名解析出的IP地址
IP=$(nslookup $domain | grep 'Address' | tail -n 1 | awk '{print $2}')

# 输出IP地址
#echo "域名 your_domains解析出的IP地址是: $IP"


# 检查地址是否一致
check_info=0
if [ -n "$hostip" ] && [ -n "$IP" ]; then
    if [ "$hostip" != "$IP" ]; then
        check_info=1
    fi
fi

# 如果IP地址不一致，则执行curl命令
if [ $check_info -eq 1 ]; then
    curl -u your_acc:your_passwd"https://now-dns.com/update?hostname=$doms"
    killall curl
else
    #echo "IP addresses are identical. Exiting script."
    exit 0
fi
