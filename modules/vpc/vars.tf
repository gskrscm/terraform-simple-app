variable "region" {
  default = "ap-south-1"
}

variable "project" {
  default = "hello"
}

variable "cidr_block" {
  default = "190.160.0.0/16"
}

variable "cidr_block_public_subnet" {
  default = "190.160.1.0/24"
}

variable "cidr_block_private_subnet" {
  default = "190.160.2.0/24"
}