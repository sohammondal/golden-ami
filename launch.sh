if aws --version ; then
    echo "awscli already installed"
else
    pip install awscli --upgrade --user
fi


ami=$(grep artifact_id manifest.json|cut -d'"' -f4|cut -d':' -f2)
region=$(grep region Packer/Template.json |cut -d'"' -f4|cut -d':' -f2)
inst_type=$(grep instance_type Packer/Template.json |cut -d'"' -f4|cut -d':' -f2)
subnet=$(grep subnet_id Packer/Template.json |cut -d'"' -f4|cut -d':' -f2)
sg=$(grep security_group_id Packer/Template.json |cut -d'"' -f4|cut -d':' -f2)

aws configure set aws_access_key_id $aws_access_key
aws configure set aws_secret_access_key $aws_secret_key
aws configure set default.region $region

aws ec2 run-instances --image-id $ami \
        			  --count 1 \
                      --instance-type $inst_type \
                      --subnet-id $subnet \
                      --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Inspector},{Key=Inspector,Value=Assessment}]' > instance.json
                       

cat instance.json

inst_id=$(grep InstanceId  instance.json |cut -d'"' -f4|cut -d':' -f2)

aws ec2  wait instance-status-ok --instance-id $inst_id

rm -rf manifest.json
