#!/bin/bash
# Uso: ./script.sh <IP_BIND>

echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST


sudo apt update && apt upgrade -y
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul -y


sudo apt install haproxy -y
sudo systemctl enable haproxy





sudo cp /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy