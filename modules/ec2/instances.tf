# Add Instances into Public subnet
# Install Nginx and deploy web application
# Add 2 instances

resource "aws_instance" "web" {
  count                       = "1"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_public_id}"
  user_data                   = "${var.userdata_web_filepath}"
  vpc_security_group_ids      = ["${aws_security_group.webservers-sg.id}"]
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  tags {
    Name = "Webserver-${count.index + 1}"
  }
}

resource "aws_instance" "backend" {
  count                       = "1"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_private_id}"
  user_data                   = "${var.userdata_backend_filepath}"
  vpc_security_group_ids      = ["${aws_security_group.backend-sg.id}"]
  associate_public_ip_address = false
  key_name                    = "${var.key_name}"

  tags {
    Name = "Backend-${count.index + 1}"
  }
}

resource "aws_instance" "db" {
  count                       = "1"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_private_id}"
  user_data                   = "${var.userdata_db_filepath}"
  vpc_security_group_ids      = ["${aws_security_group.backend-sg.id}"]
  associate_public_ip_address = false
  key_name                    = "${var.key_name}"

  tags {
    Name = "Db-${count.index + 1}"
  }
}
