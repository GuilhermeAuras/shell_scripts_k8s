#!/bin/bash

#instalacao do docker e docker compose
apt-get update

curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

apt-get install docker.io -y

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
git clone https://github.com/GuilhermeAuras/yamls.git
git clone https://github.com/guniversityBR/aplicacao-voto.git

#configuracao kubctl
mkdir /root/.kube/
touch /root/.kube/config
