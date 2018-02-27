#!/bin/bash

echo "**********WELCOME TO PACKER*******"
echo ".................................."

#Python PIP
sudo yum install -y python-dev python-pip

#Ansible
sudo pip install ansible==2.1

#AWS Inspector
sudo wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install
sudo bash install


#AWS CLI
sudo pip install awscli --upgrade --user

#AWS CloudWatch
sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
mkdir aws-cloudwatch
cd aws-cloudwatch
sudo curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip

#AWS SSM Agent already installed in source amazon linux ami
