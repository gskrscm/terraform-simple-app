# terraform-simple-app

The terraform scripts to sping a vpc with two subnets (public and private). An angularjs application will sit in public subnet and behing loadbalancer. A  nodejs application and mongodb will sit in private subnet.

## Usage: 

### Pre-requists: 

- Install AWS cli and configure AWS credentials.
- Install terraform.

### Steps to apply:

- Clone the repository and cd `dev-env` folder.
- Run `terraform init` to terraform download plugins related provider.
- Review all varialbles dev-env/vars.tf and update accordingly.
- Run `terraform plan` and `terraform apply` to spin up the infra.


## Enhancements to make it for a Prod Release:

- we can have subnets each Availability Zone's and application will span across AZ's for DR and HA.

- we can use Auto Scaling Group to manage the load on the loadbalancer.

- Manangement VPC can be created with bastion box hosted in it for operation activities.

- Public subnet should have only load balancer, and all the ec2 instances should lie in the private subnet for the better security.

- For container orchestration we can use AWS EKS.

- We can store terraform.tfstate file any version control system.

- We can use dynamodb managed service from AWS in place of mongodb.

## Monitoring:

 -Need to know application threshold and minimun requirements from Development.

### System Monitoring:

- We can user Cloudwatch for system health monitoring and create lambda functions according for remediations activities. 

### Application Monitoring:

- We can have ELK to collect application logs and create meaningful dashboards.
- We can have nagios or zabix for application monitoring.