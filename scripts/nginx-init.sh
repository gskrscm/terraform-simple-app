yum update -y
yum install docker -y
systemctl start docker 
chkconfig docker on
sleep 60
docker pull nginx
echo "<h1>Deployed from Terraform</h1>" >> /var/www/html/index.html
docker run -itd --name="nginx-app" -p 80:80 nginx
