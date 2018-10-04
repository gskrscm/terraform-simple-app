# Create a new load balancer
resource "aws_elb" "hello_elb" {
  name            = "hello-webservers-elb"
  subnets         = ["${var.subnets_list}"]
  security_groups = ["${aws_security_group.elb-sg.id}"]

  # access_logs {
  #   bucket        = "hello_elb"
  #   bucket_prefix = "elb"
  #   interval      = 60
  # }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }
  instances                   = ["${aws_instance.web.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags {
    Name = "hello-terraform-elb"
  }
}
