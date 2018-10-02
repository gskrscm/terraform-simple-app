output "hello_vpc_id" {
  value = "${aws_vpc.hello_vpc.id}"
}

output "hello_public_subnet_id" {
  value = "${aws_subnet.hello_public_subnet.id}"
}

output "hello_private_subnet_id" {
  value = "${aws_subnet.hello_private_subnet.id}"
}

output "hello_igw_id" {
  value = "${aws_internet_gateway.hello_igw.id}"
}
