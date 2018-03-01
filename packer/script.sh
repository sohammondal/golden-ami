#!/bin/bash

echo "*******************************************************************"
echo "*************************WELCOME TO PACKER*************************"
echo "*******************************************************************"

export PATH=/usr/local/bin:/usr/bin:/root/.local/bin:$PATH


#WGET & UNZIP
echo "*************************Installing wget and unzip*************************"
yum -y install wget unzip python34


echo "*************************Installing dependency for ansible*************************"
yum install gcc libffi-devel python-devel openssl-devel -y #dependency for ansible #need python-devel


# PIP,ANSIBLE & DEPENDENCIES
echo "*************************Installing pip*************************"
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user

echo "*************************Installing ansible*************************"
pip install ansible==2.4.3.0


#AWS Inspector
echo "*************************Installing AWS Inspector*************************"
sudo wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install
bash install
rm -rf install

#AWS CLI
echo "*************************Installing AWS CLI*************************"
sudo pip install awscli --upgrade --user

#AWS CloudWatch
echo "*************************Installing AWS CloudWatchMonitoringScripts*************************"
yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
mkdir aws-cloudwatch
cd aws-cloudwatch
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
cd aws-scripts-mon/
echo -e 'AWSAccessKeyId={{user `aws_access_key`}}\nAWSSecretKey={{user `aws_secret_key`}}' > awscreds.conf

#AWS SSM Agent
cd /tmp
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl enable amazon-ssm-agent

export AWS_ACCESS_KEY_ID={{user `aws_access_key`}}
export AWS_SECRET_ACCESS_KEY={{user `aws_secret_key`}}
sudo tar -cvf /root/etc_bak.tar /etc
