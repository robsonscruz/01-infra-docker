## User data
```bash
#!/bin/bash
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
```

## Add script
```bash
/bin/bash <(curl -s https://raw.githubusercontent.com/robsonscruz/01-infra-docker/master/init.sh)
```

## or Add script
```bash
wget https://raw.githubusercontent.com/robsonscruz/01-infra-docker/master/init.sh
chmod a+x init.sh && ./init.sh
```

## SSM
https://aws.amazon.com/pt/premiumsupport/knowledge-center/install-ssm-agent-ec2-linux/


## Example backend
```bash
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war -O /home/ec2-user/backend/ROOT.war
```