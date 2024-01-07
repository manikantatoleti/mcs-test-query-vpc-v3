################################################################################
# Application Load Balancer
################################################################################
resource "aws_lb" "alb_1" {
  name               = "${var.customer}-${var.environment}-${var.product}-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb_sg.id}"]
  subnets            = var.private_subnets_ids
  # subnet_mapping {
  #   subnet_id = var.private_subnet
  # }

  # subnet_mapping {
  #   subnet_id = var.private_subnet2
  # }
 
  tags = {
    "Name" = "${var.environment}-${var.product}-alb",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
}


################################################################################
# Target Group- ALB
################################################################################
resource "aws_lb_target_group" "target_group_1" {
  name = "${var.customer}-${var.environment}-${var.product}-alb-tg"
  port = var.lb_listener_port
  protocol = "HTTP"
  vpc_id = var.vpc_id
  # target_type = "instance"

  lifecycle { create_before_destroy= true }

  health_check {
    path = "/health"
    healthy_threshold = 2
    unhealthy_threshold = 10
    timeout = 120
    interval = 180
    matcher = "200"
  }

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-alb-tg",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
}


################################################################################
# ALB Listener
################################################################################
resource "aws_lb_listener" "alb_listener_1" {
  default_action {
    target_group_arn = "${aws_lb_target_group.target_group_1.arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb_1.arn}"
  port = 80
  protocol = "HTTP"
  # port = var.lb_listener_port #443
  # protocol = var.lb_listener_protocol #"HTTPS"
  # ssl_policy        = var.ssl_policy
  # certificate_arn   = var.certificate_arn

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-alb-listener",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
}


################################################################################
# ALB Listener Rules
################################################################################
resource "aws_lb_listener_rule" "rule_1" {
    action {
    target_group_arn = "${aws_lb_target_group.target_group_1.arn}"
    type = "forward"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  listener_arn = "${aws_lb_listener.alb_listener_1.id}"
  priority = 100

   tags = {
    "Name" = "${var.customer}--${var.environment}-${var.product}-alb-listener-rule",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
}

################################################################################
# Security Group for Load Balancer
################################################################################
resource "aws_security_group" "alb_sg" {
  name = "${var.customer}-${var.environment}-${var.product}-alb-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

 
  ingress {
    from_port   = var.lb_listener_port
    to_port     = var.lb_listener_port
    protocol    = "tcp"
    cidr_blocks = [var.other_cidr_blocks]
  }

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-alb-sg",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
}