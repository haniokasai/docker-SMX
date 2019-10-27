#!/bin/sh
sed -i.bak -e "s%http://[^ ]\+%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
apt update
apt install apt-transport-https ca-certificates  curl  gnupg-agent software-properties-common -y
apt clean
apt install openjdk-8-jre -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce-cli -y
