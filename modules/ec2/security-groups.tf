resource "aws_security_group" "webservers-sg" {
  name        = "webservers-sgl"
  description = "Allow 80 from all and 22 from our network"
  vpc_id      = "${var.vpc_id}"

  # ingress - Inbound Rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elb-sg" {
  name        = "elb-sgl"
  description = "Allow 80 from all"
  vpc_id      = "${var.vpc_id}"

  # ingress - Inbound Rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    // cidr_blocks = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.webservers-sg.id}"]
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "backend-sg" {
  name        = "backend-sgl"
  description = "Allow 80 from all and 22 from our network"
  vpc_id      = "${var.vpc_id}"

  # ingress - Inbound Rule
  ingress {
    from_port   = 1881
    to_port     = 1881
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
