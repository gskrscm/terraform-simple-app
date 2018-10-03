variable "ami" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {}
variable "userdata_filepath" {}
variable "vpc_id" {}
variable "key_name" {
  
}


