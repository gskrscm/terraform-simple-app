#!/bin/bash -xv
echo "From init script"
yum update -y
yum install docker -y
service docker start
chkconfig docker on
sleep 60
docker pull nginx
docker run -itd --name="nginx-app" -p 80:80 nginx
