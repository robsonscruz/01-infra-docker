#!/bin/bash
# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Set up the repository
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
# Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Template
curl -sSL https://raw.githubusercontent.com/robsonscruz/01-infra-docker/master/docker-compose.yml > /home/ubuntu/docker-compose.yml
mkdir -p /home/ubuntu/www

# Start container
docker-compose -f /home/ubuntu/docker-compose.yml up -d
