#!/bin/bash
# Uso: ./script.sh <IP_BIND> <NODE_NAME>

echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST
NODE_NAME=$1
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt upgrade
sudo apt install consul -y

sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

echo "instalando nodejs"
sudo apt install nodejs -y
echo "instalando npm"
sudo apt install npm -y

echo "Realizando git clone"
git clone https://github.com/omondragon/consulService
cd consulService/app
echo "instalando consul"
npm install consul
npm install express

echo "index$NODE_NAME.html"
sudo cp /vagrant/index$NODE_NAME.html  /var/www/html/index.html

