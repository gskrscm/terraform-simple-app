variable "region" {
  default = "ap-south-1"
}

// Provide AWS Linux ami which have docker repositories already part of it. 
variable "ami" {
  default = "ami-0912f71e06545ad88"
}

// Create key and provide name here
variable "key_name" {
  default = "test-key-mumbai"
}
