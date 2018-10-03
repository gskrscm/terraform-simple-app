variable "ami" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_public_id" {}
variable "subnet_private_id" {}
variable "userdata_web_filepath" {}
variable "userdata_backend_filepath" {}

variable "vpc_id" {}
variable "key_name" {}
variable "subnets_list" {}



