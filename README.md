# terraform-simple-app

The terraform scripts to spin up a vpc with two subnets (public and private). An instance hosting angularjs application will sit in public subnet and behind loadbalancer. An instance each hosting nodejs application and mongodb will sit in private subnet.

## Usage: 

### Pre-requisite: 

- Install AWS cli and configure AWS credentials.
- Install terraform.

### Steps to apply:

- Clone the repository and cd `dev-env` folder.
- Run `terraform init` to terraform download plugins related provider.
- Review all varialbles dev-env/vars.tf and update accordingly.
- Run `terraform plan` and `terraform apply` to spin up the infra.


## Enhancements to make it for a Prod Release:

- We can have subnets in each Availability Zone's and application will span across AZ's for DR and HA.

- We can use Auto Scaling Group to manage the load on the loadbalancer.

- We can have manangement VPC created with bastion box hosted in it for operation activities.

- Public subnet should have only load balancer, and all the ec2 instances should lie in the private subnet for the better security.

- For container orchestration we can use AWS EKS.

- We should version control terraform.tfstate file and have CI process (Unit test also) around.

- We can use dynamodb managed service from AWS in place of mongodb.

- We can make more generic terraform modules which can be used for any requirement by variablizing all parameters.

- We need to have Key rotation process for better security.

- We can implement WAF for DDOS protection.

- We can have route 53 for DNS.

- We can have blue green deployment strategy. 

## Monitoring:

 -Need to know application threshold and minimum requirements from Development team.

### System Monitoring:

- We can use Cloudwatch for system health monitoring and create lambda functions accordingly for remediations activities.

### Application Monitoring:

- We can have ELK to collect application logs and create meaningful dashboards.
- We can have nagios or zabix for application monitoring.



# Tools Selection: 

## Terraform: 

As terraform will help IAS and Platform agnostinc.
As terraform declrative folows graph theory.
As I have experience with terraform, so selected terraform.


