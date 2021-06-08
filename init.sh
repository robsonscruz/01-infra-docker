#!/bin/bash

# SSM Auth
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

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
mkdir -p /home/ec2-user/backend && chmod 777 -R /home/ec2-user/backend
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war -O /home/ec2-user/backend/ROOT.war

# Start container
sudo /usr/local/bin/docker-compose -f /home/ec2-user/docker-compose.yml up -d
