#!/bin/bash
#instalacao do docker e docker compose

sudo apt-get update

if [ $? -eq 0 ]; then echo "sucesso passou o apt-get update"; else exit 1; fi

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o curl"; else exit 1; fi

sudo chmod +x /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o chmod"; else exit 1; fi

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o link simbolico"; else exit 1; fi

sudo apt-get install docker.io -y

if [ $? -eq 0 ]; then echo "sucesso passou a instalacao do docker"; else exit 1; fi
