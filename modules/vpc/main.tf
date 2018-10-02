resource "aws_vpc" "hello_vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "default"

  tags {
    Name = "${var.project}"
  }
}

resource "aws_subnet" "hello_public_subnet" {
  vpc_id     = "${aws_vpc.hello_vpc.id}"
  cidr_block = "${var.cidr_block_public_subnet}"

  tags {
    Name = "${var.project}_public_subnet"
  }
}

resource "aws_subnet" "hello_private_subnet" {
  vpc_id     = "${aws_vpc.hello_vpc.id}"
  cidr_block = "${var.cidr_block_private_subnet}"

  tags {
    Name = "${var.project}_public_subnet"
  }
}

resource "aws_internet_gateway" "hello_igw" {
  vpc_id = "${aws_vpc.hello_vpc.id}"

  tags {
    Name = "${var.project}_igw"
  }
}

resource "aws_route_table" "hello_web_rt" {
  vpc_id = "${aws_vpc.hello_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.hello_igw.id}"
  }

  tags {
    Name = "${var.project}_web_rt"
  }
}

resource "aws_route_table_association" "hello_web_rt_a" {
  subnet_id      = "${aws_subnet.hello_public_subnet.id}"
  route_table_id = "${aws_route_table.hello_web_rt.id}"
}
