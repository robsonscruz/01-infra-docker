#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# Docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.29.1/docker-compose-linux-x86_64 -o /home/ec2-user/docker-compose
sudo chmod a+x /home/ec2-user/docker-compose && sudo mv /home/ec2-user/docker-compose /usr/local/bin/docker-compose

# Template
curl -sSL https://raw.githubusercontent.com/robsonscruz/01-infra-docker/master/docker-compose.yml > /home/ec2-user/docker-compose.yml
mkdir -p /home/ec2-user/www && chmod 777 -R /home/ec2-user/www

# Start container
docker-compose -f /home/ec2-user/docker-compose.yml up -d
