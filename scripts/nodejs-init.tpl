#!/bin/bash -xv
echo "From init script"
yum update -y
yum install docker -y
service docker start
chkconfig docker on
sleep 60
docker pull gskrscm/node
docker run -itd --name="node-app-1" -p 1881:1881 gskrscm/node
