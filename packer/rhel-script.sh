#!/bin/bash

echo "**********WELCOME TO PACKER**********"
echo "....................................."

#WGET
sudo yum -y install wget

# EPEL Download for installing PIP
#wget http://download-ib01.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#sudo rpm -i epel-release-latest-7.noarch.rpm #Installing epel
#sudo yum update

sudo easy_install pip
sudo yum install gcc libffi-devel python-devel openssl-devel -y #dependency for ansible #need python-devel
sudo pip install ansible==2.1


#AWS Inspector
sudo wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install
sudo bash install
rm -rf install

#AWS CLI
sudo pip install awscli --upgrade --user

#AWS CloudWatch
sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
mkdir aws-cloudwatch
cd aws-cloudwatch
sudo curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
cd aws-scripts-mon/
echo -e 'AWSAccessKeyId={{user `aws_access_key`}}\nAWSSecretKey={{user `aws_secret_key`}}' > awscreds.conf

#AWS SSM Agent
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent
