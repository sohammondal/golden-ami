#!/bin/bash
sudo yum -y install wget unzip
sudo easy_install pip
sudo yum install gcc libffi-devel python-devel openssl-devel -y
sudo pip install ansible==2.4.3.0
sudo wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install
sudo bash install
rm -rf install
sudo pip install awscli --upgrade --user
sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
mkdir aws-cloudwatch
cd aws-cloudwatch
sudo curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
cd aws-scripts-mon/
echo -e 'AWSAccessKeyId={{user `aws_access_key`}}\nAWSSecretKey=3vXLL+bR6jvDQy1G9D+oqGmRV3oRXQZo7kGtReJR' > awscreds.conf
cd /tmp",
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
export PATH=/usr/local/bin:/usr/bin:/root/.local/bin:$PATH
export AWS_ACCESS_KEY_ID={{user `aws_access_key`}}
export AWS_SECRET_ACCESS_KEY={{user `aws_secret_key`}}
sudo tar -cvf /root/etc_bak.tar /etc
