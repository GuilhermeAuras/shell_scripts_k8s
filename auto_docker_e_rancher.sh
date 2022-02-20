#!/bin/bash

#instalacao do docker e docker compose
sudo apt-get update

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo apt-get install docker.io -y

#subindo o rancher server
docker run -d --name rancher --restart=unless-stopped --privileged -v /var/lib/ -p 80:80 -p 443:443 rancher/rancher

#instalando o kubctl
apt-get update

apt-get install -f apt-transport-https gnupg2 -y

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get install kubectl -y

#git clone
git clone https://github.com/GuilhermeAuras/devops

#configuracao kubctl
mkdir /root/.kube/
touch /root/.kube/config
