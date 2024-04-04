#!/bin/bash
#====== Resize EBS
resize2fs /dev/xvda

#====== Install SSM
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
start amazon-ssm-agent
chkconfig amazon-ssm-agent on

echo ECS_CLUSTER="${cluster_name}" >> /etc/ecs/ecs.config
echo ECS_INSTANCE_ATTRIBUTES={"cluster_type":"web"} >> /etc/ecs/ecs.config

#====== Install Kernel Headers
yum install -y kernel-devel-$(uname -r)