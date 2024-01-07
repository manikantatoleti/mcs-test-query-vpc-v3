resource "aws_efs_file_system" "app_efs" {
  creation_token   = "${var.customer}-${var.environment}-${var.product}-efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted = true

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-efs",
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

resource "aws_efs_mount_target" "efs_mount_target" {
  file_system_id  = aws_efs_file_system.app_efs.id
  subnet_id       = var.private_subnet_id
  security_groups = [aws_security_group.efs_sg.id]
}
resource "aws_security_group" "efs_sg" {
  name        = "${var.customer}-${var.environment}-${var.product}-efs-sg"
  vpc_id      = var.vpc_id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-efs-sg",
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
