  ################################################################################
# Lunch Template
################################################################################
data "aws_ami" "lt_image_id" {
  count = var.lt_image_id != "" ? 0 : 1
  most_recent      = true
  name_regex       = "^Ondot AmazonLinux2 Golden Image-\\d{3}"
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["Ondot AmazonLinux2 Golden Image-*"]
  }
}

resource "aws_launch_template" "lt_1" {
  name_prefix = "${var.customer}-${var.environment}-${var.product}-lt"
  image_id = var.lt_image_id != "" ? var.lt_image_id : data.aws_ami.lt_image_id[1].id
  # image_id = "${var.lt_image_id}" #data.aws_ami.lt_image_id.id  # "ami-0c76be34ffbfb0b14"
  instance_type = "${var.instance_type}"
  iam_instance_profile {
    name = var.iam_instance_profile
  }
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = "${var.root_volume_size}"
    }
  }
  key_name = aws_key_pair.deployer.key_name
  network_interfaces {
    security_groups = [aws_security_group.instance_sg.id]
    associate_public_ip_address = false
  }
  
  lifecycle {
    create_before_destroy = true
  }
    user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo mkdir /opt/ondot/mnt -p
    sudo mount -t nfs4 ${var.efs_file_system_dns_name}:/ /opt/ondot/mnt
    EOF
    ) 

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-lt",
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
resource "aws_security_group" "instance_sg" {
  name   = "${var.customer}-${var.environment}-${var.product}-asg_sg"
  vpc_id = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.vpc_cidr]
  }
   
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.app_vpp_cidr]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] #[var.private_subnets_cidr]
  }
   tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-asg_sg",
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
resource "aws_security_group" "sg2" {
  name   = "${var.customer}-${var.environment}-${var.product}-asg_sg2"
  vpc_id = "${var.vpc_id}"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.mss_cidr]
  }
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-asg_sg2",
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
# Private Key
################################################################################
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
################################################################################
# Key Pair
################################################################################
resource "aws_key_pair" "deployer" {
  key_name   = "${var.customer}-${var.environment}-${var.product}-lt-key"
  public_key = tls_private_key.example.public_key_openssh

  tags = {
    "Name" = "${var.environment}-${var.product}-lt-key",
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
# Auto Scaling group-ALB
################################################################################
resource "aws_autoscaling_group" "asg" {
  name = "${var.customer}-${var.environment}-${var.product}-asg"
  min_size = "${var.asg_min_size}"
  desired_capacity = "${var.asg_desired_capacity}"
  max_size = "${var.asg_max_size}"
  # health_check_grace_period = 300
  # health_check_type         = "ELB"
  launch_template {
    id      = "${aws_launch_template.lt_1.id}"
  }
  termination_policies = [
    "OldestInstance",
    "OldestLaunchConfiguration",
  ]
  
  tag {
      key                 = "Name"
      value               = "${var.environment}-${var.product}-asg"
      propagate_at_launch = true
    }
  tag {
    key                 = "environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Region"
    value               = "${var.aws_region}"
    propagate_at_launch = true
  }
 
   tag {
    key                 = "Appname"
    value               = "tde"
    propagate_at_launch = true
  }
  tag {
    key                 = "requestor"
    value               = "${var.requestor}"
    propagate_at_launch = true
  }
  tag {
    key                 = "customer"
    value               = "${var.customer}"
    propagate_at_launch = true
  }
  tag {
    key                 = "tenant"
    value               = "${var.tenant}"
    propagate_at_launch = true
  }
  tag {
    key                 = "product"
    value               = "${var.product}"
    propagate_at_launch = true
  }
  tag {
    key                 = "manager"
    value               = "${var.manager}"
    propagate_at_launch = true
  }
  tag {
    key                 = "owner"
    value               = "${var.owner}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Request_id"
    value               = "${var.Request_id}"
    propagate_at_launch = true
  }

  vpc_zone_identifier = [var.private_subnet]
  target_group_arns = [var.target_group_arns]
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_instance_connect_endpoint" "ec2" {
  security_group_ids = [
    var.security_group_sg_id
  ]
  subnet_id = "${var.private_subnet_id}"
}