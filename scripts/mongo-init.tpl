#!/bin/bash -xv
echo "From init script"
yum update -y
yum install docker -y
service docker start
chkconfig docker on
sleep 60
docker pull mongo
docker run -itd --name="mongo-db" mongo