# terraform-simple-app
The terraform scripts for some nodejs, mongoldb and angularjs application 


Release: 
Can have subnets each AZ's and application will span across AZ's for DR and HA

ASG can be used to manage the load on the loadbalancer. 

Manangement VPC can be created with bastion box hoster init for operation activities. 
Public subnet should have only load balancer, and all the ec2 instances should lie in the private subnet for the better security. 


For container orchestration we can use EKS. 

Monitoring: 
Need to know application threshold and minimun requirements. 

System: 
Cloudwatch we can setup for health monitoring and create lambda functions according for remediations. 

Application: 
log monitoring



