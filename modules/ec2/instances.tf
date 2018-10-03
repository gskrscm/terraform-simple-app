# Add Instances into Public subnet
# Install Nginx and deploy web application
# Add 2 instances

resource "aws_instance" "web" {
  count                  = "1"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  user_data              = "${var.userdata_filepath}"
  vpc_security_group_ids = ["${aws_security_group.webservers-sg.id}"]
  associate_public_ip_address = true
  key_name = "${var.key_name}"

  tags {
    Name = "Webserver-${count.index + 1}"
  }
}