#!/bin/bash

#Xoá File không cần thiết
rm -f auto.sh
rm -f auto.sh*
rm -f DB
rm -f DB*
rm -f remsquid.sh
rm -f remsquid.sh*
rm -f squid4.sh
rm -f squid4.sh*
rm -f squid.ver
rm -f squid.ver*

#cài Dropbear
wget https://raw.githubusercontent.com/HuaNhutLinh128/Auto-all/master/DB	
chmod +x DB
./DB

#Cập nhật Banner
rm -f /etc/banner
wget -O /etc/banner "https://raw.githubusercontent.com/HuaNhutLinh128/Auto-all/master/hello2020"
service ssh restart
service dropbear restart

#Tạo User
cd /usr/local/sbin/
wget https://raw.githubusercontent.com/HuaNhutLinh128/Auto-all/master/b
chmod +x ./*
cd ~

# xoá speedtest
cd /usr/local/sbin/
rm -f speedtest
chmod +x ./*
dos2unix ./* &> /dev/null	
sed -i 's|/etc/squid/squid.conf|/etc/privoxy/config|g' ./*
sed -i 's|http_port|listen-address|g' ./*
cd ~

#cài speedtest
sudo apt-get install lsb-release -y
sudo apt-get install gnupg1 apt-transport-https dirmngr -y
export INSTALL_KEY=379CE192D401AB61
export DEB_DISTRO=$(lsb_release -sc)
echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update -y
sudo apt-get remove speedtest-cli
sudo apt-get install speedtest

#cài vnstat
sudo apt install vnstat -y
vnstat -u

#cài Stunnel
wget https://raw.githubusercontent.com/HuaNhutLinh128/Auto-all/master/Squid4%20Debian9/remsquid.sh
chmod +x remsquid.sh
./remsquid.sh
wget https://raw.githubusercontent.com/HuaNhutLinh128/Auto-all/master/Squid4%20Debian9/squid4.sh 
chmod +x squid4.sh
./squid4.sh

#cài Shadowsocks
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 

#cài BBR Plus
wget –no-check-certificate -O tcp.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh
chmod +x tcp.sh
./tcp.sh
