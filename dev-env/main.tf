module "vpc" {
  source = "../modules/vpc"
}

module "ec2" {
  source    = "../modules/ec2"
  ami       = "${var.ami}"
  subnet_id = "${module.vpc.hello_public_subnet_id}"
  userdata_filepath = "${file("../scripts/nginx-init.sh")}"
  vpc_id = "${module.vpc.hello_vpc_id}"
  key_name = "${var.key_name}"
}

output "vpc_public_subnet_id" {
  value = "${module.vpc.hello_public_subnet_id}"
}
