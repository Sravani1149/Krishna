resource "aws_lb_target_group" "TGRP_instance" {
  name        = "Target-GRP"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.myvpc.id}"
}


resource "aws_lb" "NLB" {
  name               = "Network-LB"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.subnet01.id}"]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group_attachment" "NLBA" {
  target_group_arn = aws_lb_target_group.TGRP_instance.arn
  target_id        = aws_instance.Krishna.id
  port             = 80
}

resource "aws_lb_listener" "NLBL" {
  load_balancer_arn = aws_lb.NLB.arn
port = 80  
protocol          = "HTTP"
default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
    }
  

