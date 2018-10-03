module "vpc" {
  source = "../modules/vpc"
}

module "ec2" {
  source                    = "../modules/ec2"
  ami                       = "${var.ami}"
  subnet_public_id          = "${module.vpc.hello_public_subnet_id}"
  subnet_private_id         = "${module.vpc.hello_private_subnet_id}"
  userdata_web_filepath     = "${file("../scripts/nginx-init.tpl")}"
  userdata_backend_filepath = "${file("../scripts/nodejs-init.tpl")}"
  vpc_id                    = "${module.vpc.hello_vpc_id}"
  key_name                  = "${var.key_name}"
  subnets_list              = "${module.vpc.hello_public_subnet_id}"
}

output "vpc_public_subnet_id" {
  value = "${module.vpc.hello_public_subnet_id}"
}
